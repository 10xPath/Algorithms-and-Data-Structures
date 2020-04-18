import UIKit

var str = "Hello, playground"


// * Definition for singly-linked list.
  public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init(_ val: Int) {
          self.val = val
          self.next = nil
     }
 }
 

//First solution
//let secondHalfReversedStart = reverseLinkedList(currentNode: firstHalfEnd?.next)
//private func firstHalfStart(currentNode: ListNode<Int>?) -> ListNode<Int>? {
//    var fast = currentNode
//    var slow = currentNode
//
//    while (fast?.next != nil && fast?.next?.next != nil) {
//        // prev = slow
//        fast = fast?.next?.next
//        slow = slow?.next
//    }
//
//    return slow
//}

//Second solution
//        var reversedHead = reversedLinkedList(head: startOfLastHalf)
//func lastHalfNode(head: ListNode?) -> ListNode? {
//    var slow = head
//    var fast = head
//    var prev = slow
//    while(fast != nil) {
//        prev = slow
//        slow = slow?.next
//        fast = fast?.next?.next
//    }
//    prev?.next = nil
//    return slow
//}

