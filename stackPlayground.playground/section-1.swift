// Playground - noun: a place where people can play

import UIKit

class Stack {
  
  var myStack = [String]()
 
  
  func pushMyStack(stringToPush: String) {
    self.myStack.append(stringToPush)
    
  }
  
  func popMyStack()-> String? {
    if !self.myStack.isEmpty {
      var returnString = self.myStack.last
      self.myStack.removeLast()
      return returnString
    } else {
      return (nil)
    }
  }
}


var pancakeStack = Stack()

pancakeStack.pushMyStack("one")
pancakeStack.pushMyStack("one")
pancakeStack.pushMyStack("one")

pancakeStack.popMyStack()

pancakeStack




