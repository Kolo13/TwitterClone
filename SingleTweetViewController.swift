//
//  SingleTweetViewController.swift
//  TwitterClone
//
//  Created by Kori Kolodziejczak on 10/9/14.
//  Copyright (c) 2014 Kori Kolodziejczak. All rights reserved.
//

import UIKit

class SingleTweetViewController: UIViewController {
  
  var selectedTweet : Tweet?

  
  @IBOutlet weak var singleTweetImage: UIImageView!
  @IBOutlet weak var singleTweetLabel: UILabel!
  @IBOutlet weak var singleTweetRetweetLabel: UILabel!
  @IBOutlet weak var singleTweetFavoritedLabel: UILabel!
  @IBOutlet weak var singleTweetUser: UILabel!

  @IBAction func SingleTweetViewControllerButton(sender: UIButton) {
    let newVC = self.storyboard?.instantiateViewControllerWithIdentifier("HOME_VC") as HomeTimelineViewController
    newVC.screenName = selectedTweet?.screenName
    newVC.headerName = selectedTweet?.userName
    newVC.userImage = selectedTweet!.image
    self.navigationController?.pushViewController(newVC, animated: true)
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    singleTweetLabel.text = self.selectedTweet?.text
    singleTweetImage.image = selectedTweet?.image
    singleTweetRetweetLabel.text = "\(selectedTweet!.numRetweets)"
    singleTweetFavoritedLabel.text = "\(selectedTweet!.numFavorites)"
    singleTweetUser.text = selectedTweet?.userName
  }

  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
  }
  
}
