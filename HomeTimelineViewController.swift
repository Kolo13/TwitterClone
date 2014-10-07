//
//  HomeTimelineViewController.swift
//  TwitterClone
//
//  Created by Kori Kolodziejczak on 10/6/14.
//  Copyright (c) 2014 Kori Kolodziejczak. All rights reserved.
//

import UIKit

class HomeTimelineViewController: UIViewController, UITableViewDataSource {

  
  var tweets : [Tweet]?
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
        if let path = NSBundle.mainBundle().pathForResource("Tweet", ofType: "json") {
       
          var error : NSError?
          let jsonData = NSData(contentsOfFile: path)
        
          self.tweets = Tweet.parseJSONDataIntoTweets(jsonData!)
          self.tweets = self.tweets?.sorted({ (S1:Tweet , S2:Tweet) -> Bool in
            return S1.text < S2.text
          })
         
      }

        // Do any additional setup after loading the view.
    }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if self.tweets != nil {
      return self.tweets!.count
    }else{
      return 0
      
    }
  }
  
  
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("Tweet_Cell", forIndexPath: indexPath) as UITableViewCell
    let tweet = self.tweets![indexPath.row]
    cell.textLabel?.text = tweet.text
    return cell
    
  
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
