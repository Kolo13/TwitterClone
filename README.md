TwitterClone
============
Monday:

Create groups in your project for the model, view, and controller layer of your app
Successfully parse the provided JSON file into Tweet model objects
Add a table view to your view controller, and have it display all of the tweets that you parsed from the JSON

Tuesday

Use the Accounts framework to get access to the user’s twitter account
Use the social framework to fetch the users timeline
Bake in status code checking into your network call and log out the status code
Have your tableview display the user’s timeline once the network operation is completed back on the main thread
Create a custom tableview cell class, and display the avatar image for each tweet in an image view on each cell

Wednesday

Create a network controller class that will be responsible for making all network calls to Twitter. The view controllers themselves should not be touching any URLS
Create a second view controller called SingleTweetViewController that is devoted to just showing a single tweet, the user who tweeted it, and how many retweets and favorite it has. This view controller should be segued to when the user selects a cell from the home timeline.
Move your image downloading to the network controller as well. 
Using autolayout on your custom cell, achieve dynamic cell height.  Check out this blog post to get you started with this particular feature: http://www.appcoda.com/self-sizing-cells/ (Links to an external site.)

Thursday

Remove all Segues from your app, and instead use the push and pop methods on your navigation controller.
Create a nib for your tweet cell, so we don't have to layout the same tableview cell in multiple spots.
Create a third view controller that is devoted to showing a user’s most recent tweets. This should be pushed onto the navigation stack when the user clicks on the user’s picture in the single tweet view controller.
Create a table view header view in your user timeline view controller. It should display the user's image and the user's name.
