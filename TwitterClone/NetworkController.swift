//
//  NetworkController.swift
//  TwitterClone
//
//  Created by Kori Kolodziejczak on 10/8/14.
//  Copyright (c) 2014 Kori Kolodziejczak. All rights reserved.
//

import Foundation
import Accounts
import Social


class NetworkController {
  
  var twitterAccount :  ACAccount?
  let imageQueue = NSOperationQueue()
 
  init(){
    
    self.imageQueue.maxConcurrentOperationCount = 6
    
  }
  
  func fetchUserTimeline(screenName :String?, completionHandler : (errorDescription: String?, tweets : [Tweet]?) -> Void) {
    
    let accountStore = ACAccountStore()
    let accountType = accountStore.accountTypeWithAccountTypeIdentifier(ACAccountTypeIdentifierTwitter)
    
    accountStore.requestAccessToAccountsWithType(accountType, options: nil) { (granted: Bool, error : NSError!) -> Void in
      
      if granted {
        let accounts = accountStore.accountsWithAccountType(accountType)
        self.twitterAccount = accounts.first as ACAccount?
        
        
       
        let url = NSURL(string:"https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name=\(screenName!)")!
   
        let twitterRequest = SLRequest(forServiceType: SLServiceTypeTwitter, requestMethod: SLRequestMethod.GET, URL: url, parameters: nil)
        twitterRequest.account = self.twitterAccount
        
        twitterRequest.performRequestWithHandler({ (data, httpResponse, error) -> Void in
          
          switch httpResponse.statusCode {
            
          case 200...299:
            let tweets = Tweet.parseJSONDataIntoTweets(data)
            completionHandler(errorDescription: nil, tweets: tweets)
            println("This is good")
            
          case 400...499:
            completionHandler(errorDescription: "Client fault", tweets: nil)
            
          case 500...599:
            completionHandler(errorDescription: "Server fault", tweets: nil)
            
          default:
            println("Something")
          }
        })
      }
    }
  }
  
  
  
  
  
 
  
  func fetchHomeTimeline( completionHandler : (errorDescription: String?, tweets : [Tweet]?) -> Void) {
    
  
    
    let accountStore = ACAccountStore()
    let accountType = accountStore.accountTypeWithAccountTypeIdentifier(ACAccountTypeIdentifierTwitter)
    
    accountStore.requestAccessToAccountsWithType(accountType, options: nil) { (granted: Bool, error : NSError!) -> Void in
      
      if granted {
        let accounts = accountStore.accountsWithAccountType(accountType)
        self.twitterAccount = accounts.first as ACAccount?
        
        let url = NSURL(string:"https://api.twitter.com/1.1/statuses/home_timeline.json")
       
        let twitterRequest = SLRequest(forServiceType: SLServiceTypeTwitter, requestMethod: SLRequestMethod.GET, URL: url, parameters: nil)
        twitterRequest.account = self.twitterAccount
        
        twitterRequest.performRequestWithHandler({ (data, httpResponse, error) -> Void in
          
          switch httpResponse.statusCode {
            
            case 200...299:
              let tweets = Tweet.parseJSONDataIntoTweets(data)
              completionHandler(errorDescription: nil, tweets: tweets)
              println("This is good")
            
            case 400...499:
              completionHandler(errorDescription: "Client fault", tweets: nil)
            
            case 500...599:
              completionHandler(errorDescription: "Server fault", tweets: nil)
            
            default:
              println("Something")
          }
        })
      }
    }
  }

  func loadImage(tweet: Tweet, completion: (image: UIImage) -> Void) {
        var imageDownloadQueue = NSOperationQueue()
    
        if tweet.userImageString.isEmpty {
          println("userImageString is empty")
        }else{
          var userProfilePicURL = NSURL(string: tweet.userImageString)
    
          var downloadOperation = NSBlockOperation { () -> Void in
            var profilePhotoData = NSData(contentsOfURL: userProfilePicURL!)
            var profilePhotoImage = UIImage(data: profilePhotoData!)
            completion(image: profilePhotoImage!)
          }
    
          downloadOperation.qualityOfService = NSQualityOfService.Background
          imageDownloadQueue.addOperation(downloadOperation)
    
        }
    
      }
  func downloadUserImageForTweet(tweet : Tweet, completionHandler : (image : UIImage) -> (Void)) {
    
    let url = NSURL(string: tweet.userImageString)
    let imageData = NSData(contentsOfURL: url!)
    
    
    //jump back on the main queu
//    NSOperationQueue.mainQueue()
    
  }
  
  
  
}