//
//  HomeTimelineViewController.swift
//  TwitterClone
//
//  Created by Kori Kolodziejczak on 10/6/14.
//  Copyright (c) 2014 Kori Kolodziejczak. All rights reserved.
//

import UIKit
import Accounts
import Social

class HomeTimelineViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

  @IBOutlet weak var headerNameLabel: UILabel!
  @IBOutlet weak var headerPic: UIView!
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var headerImage: UIImageView!
 

  var tweets : [Tweet]?
  var twitterAccount : ACAccount?
  let networkController = NetworkController()
  var screenName : String?
  var headerName : String?
  var userImage : UIImage?
  
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.tableView.registerNib(UINib(nibName: "UserImageTableViewCell", bundle: NSBundle.mainBundle())!, forCellReuseIdentifier: "TWEET_CELL")
  
    if screenName != nil {
      self.networkController.fetchUserTimeline(self.screenName!, { (errorDescription, tweets) -> Void in
        self.tweets = tweets
        NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
          self.headerNameLabel.text = self.headerName!
          self.headerImage.image = self.userImage
          self.tableView.reloadData()
        })
      })
    }else{
      self.networkController.fetchHomeTimeline { (errorDescription, tweets) -> Void in
        if errorDescription == nil {
          self.tweets = tweets
          NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
           
           
            self.headerNameLabel.text = "Home Timeline"
            self.tableView.reloadData()
          })
        }else{
          println(errorDescription)
        }
      }
    }
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  
    if self.tweets != nil {
      return self.tweets!.count
    }else{
      return 0
    }
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("TWEET_CELL", forIndexPath: indexPath) as UserImageTableViewCell
    let tweet = self.tweets![indexPath.row]
    cell.twitterLabel.hidden = true
    
    if tweet.image != nil {
      cell.twitterLabel.text = tweet.text
      cell.twitterLabel.hidden = false
      cell.twitterImage.image = tweet.image
    } else {
      networkController.loadImage(tweet, completion: { (image) -> Void in
        NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
        cell.twitterLabel.text = tweet.text
        cell.twitterLabel.hidden = false
        tweet.image = image
        cell.twitterImage.image = image
        })
      })
    }
    return cell
  }
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let newVC = self.storyboard?.instantiateViewControllerWithIdentifier("SINGLE_VC") as SingleTweetViewController
    newVC.selectedTweet = self.tweets?[indexPath.row]
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
    self.navigationController?.pushViewController(newVC, animated: true)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}

