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

  @IBAction func SingleTweetViewControllerButton(sender: UIButton) {
    
    let newVC = self.storyboard?.instantiateViewControllerWithIdentifier("HOME_VC") as HomeTimelineViewController
    newVC.screenName = selectedTweet?.screenName
    self.navigationController?.pushViewController(newVC, animated: true)

  }

  @IBOutlet weak var singleTweetImage: UIImageView!
  @IBOutlet weak var singleTweetLabel: UILabel!
  @IBOutlet weak var singleTweetRetweetLabel: UILabel!
  @IBOutlet weak var singleTweetFavoritedLabel: UILabel!

       override func viewDidLoad() {
        super.viewDidLoad()
      singleTweetImage.image = selectedTweet?.image
      
      

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
