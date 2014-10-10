//
//  tweet.swift
//  TwitterClone
//
//  Created by Kori Kolodziejczak on 10/6/14.
//  Copyright (c) 2014 Kori Kolodziejczak. All rights reserved.
//

import Foundation
import UIKit

class Tweet {
  
  var text : String
  var userProfile : NSDictionary
  var userImageString : String
  var image : UIImage?
  var avatarImage : UIImage?
  var userName : String
  var numRetweets : Int
  var userID : Int
  var numFavorites : Int
  var screenName : String
  
  
  init (tweetInfo : NSDictionary) {
    self.text = tweetInfo["text"] as String
    self.userProfile = tweetInfo["user"] as NSDictionary
    self.userImageString = userProfile["profile_image_url"] as String
    self.userName = userProfile["name"] as String
    self.numRetweets = tweetInfo["retweet_count"] as Int
    self.userID = tweetInfo["id"] as Int
    self.screenName = userProfile["screen_name"] as String
    self.numFavorites = tweetInfo["favorite_count"] as Int
  
    
    
  }
  
  
  class func parseJSONDataIntoTweets(rawJSONData : NSData) -> [Tweet]? {
    var error : NSError?
    if let JSONArray = NSJSONSerialization.JSONObjectWithData(rawJSONData, options: nil, error: &error) as? NSArray {
    
      var tweets = [Tweet]()
      for JSONDictionary in JSONArray {
        if let tweetDictionary = JSONDictionary as? NSDictionary {
          var newTweet = Tweet(tweetInfo: tweetDictionary)
          
          
          tweets.append(newTweet)
        }
      }
    return tweets
      
    }
    return nil
  }
  
  class func parseJSONDataIntoDict(rawJSONData : NSData) -> NSDictionary? {
    var error : NSError?
    
    if let twitDict = NSJSONSerialization.JSONObjectWithData(rawJSONData, options: nil, error: &error) as? NSDictionary {
      return twitDict
    }
    return nil
  }


}

