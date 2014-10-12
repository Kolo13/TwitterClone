// Playground - noun: a place where people can play

import UIKit


class Queue {
  
  var queueArray = [String]()
  
  func enqueue(stringToEnqueue: String) {
    self.queueArray.append(stringToEnqueue)
  }
  
  func dequeue() -> String? {
    if !queueArray.isEmpty {
      var dequeueString = queueArray.first
      queueArray.removeAtIndex(0)
      return dequeueString!
    }else{
      return (nil)
    }
  }
}



var myQueue = Queue()

myQueue.enqueue("Hello")
myQueue.enqueue("There")

myQueue.dequeue()


myQueue

