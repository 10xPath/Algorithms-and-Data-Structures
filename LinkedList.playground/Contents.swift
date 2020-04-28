import UIKit

var str = "Hello, playground"


class ListNode {
    var next: ListNode?
    var value: Int?
    
    init(value: Int) {
        self.value = value
    }
}

class MyLinkedList {
    
    var head:ListNode?
    
    
    /** Initialize your data structure here. */
    init() {
        head = nil
    }
    
    /** Get the value of the index-th node in the linked list. If the index is invalid, return -1. */
    func get(_ index: Int) -> Int {
        var indexCounter = 0
        var currentNode = head
        
        while currentNode != nil {
            
            if indexCounter == index {
                return currentNode?.value ?? -1
            }
            
            indexCounter += 1
            
            currentNode = currentNode?.next
        }
        
        return -1
    }
    
    /** Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list. */
    func addAtHead(_ val: Int) {
        let newNode = ListNode(value: val)
        newNode.next = head
        head = newNode
    }
    
    /** Append a node of value val to the last element of the linked list. */
    func addAtTail(_ val: Int) {
        let newNode = ListNode(value: val)
        var currentNode = head
        if head == nil {
            head = newNode
        }
        while currentNode != nil {
            if currentNode?.next == nil {
                currentNode?.next = newNode
                break
            }
            currentNode = currentNode?.next
        }
    }
    
    /** Add a node of value val before the index-th node in the linked list. If index equals to the length of linked list, the node will be appended to the end of linked list. If index is greater than the length, the node will not be inserted. */
    func addAtIndex(_ index: Int, _ val: Int) {
        let newNode = ListNode(value: val)
        var lengthCount = 0
        var currentNode = head
        var prev:ListNode?
        
        if index == 0 {
            head = newNode
        }
        
        while currentNode != nil {
            if lengthCount == index {
                newNode.next = currentNode
                prev?.next = newNode
            }
            
            if lengthCount + 1 == index && currentNode?.next == nil{
                currentNode?.next = newNode
                break
            }
            
            lengthCount += 1
            
            prev = currentNode
            currentNode = currentNode?.next
        }
    }
    
    /** Delete the index-th node in the linked list, if the index is valid. */
    func deleteAtIndex(_ index: Int) {
        
        var indexCounter = 0
        var currentNode = head
        var prev: ListNode?
        
        if index == 0 {
            head = currentNode?.next
            currentNode = nil
        }
        while currentNode != nil {
            if indexCounter == index {
                prev?.next = currentNode?.next
            }
            
            indexCounter += 1
            
            prev = currentNode
            currentNode = currentNode?.next
        }
    }
}

extension MyLinkedList: CustomStringConvertible {
    // 2
    public var description: String {
        // 3
        var text = "["
        var node = head
        // 4
        while node != nil {
            text += "\(node!.value)"
            node = node!.next
            if node != nil { text += ", " }
        }
        // 5
        return text + "]"
    }
}

/**
 * Your MyLinkedList object will be instantiated and called as such:
 * let obj = MyLinkedList()
 * let ret_1: Int = obj.get(index)
 * obj.addAtHead(val)
 * obj.addAtTail(val)
 * obj.addAtIndex(index, val)
 * obj.deleteAtIndex(index)
 */

let linkedList = MyLinkedList()
print("LinkedList \(linkedList)")
linkedList.addAtHead(1)
print("LinkedList \(linkedList)")
linkedList.addAtTail(3)
print("LinkedList \(linkedList)")
linkedList.addAtIndex(1, 2)
print("LinkedList \(linkedList)")
print("Get \(linkedList.get(1))")
linkedList.deleteAtIndex(0)
print("LinkedList \(linkedList)")

print("Get \(linkedList.get(0))")


//Leetcode 141

func hasCycle(_ head: ListNode?) -> Bool {
    var slow = head
    var fast = slow?.next
    
    while slow != nil && fast != nil{
        if slow === fast{
            return true
        }
        slow = slow?.next
        fast = fast?.next?.next
    }
    
    return false
}


//Leetcode 160

func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
    
    var a: ListNode? = headA
    var b: ListNode? = headB
    
    //a and b equalize the second round and eventually they will both be nil or have the same value
    while a !== b {
        a = a == nil ? headB : a?.next
        b = b == nil ? headA : b?.next
    }
    
    return a;
}

//Leetcode 19
func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    guard let  head = head else {
        return nil
    }
    
    var newHead = ListNode(value: 0)
    var slow:ListNode? = newHead
    var fast:ListNode? = newHead
    
    newHead.next = head
    
    for i in 0...n {
        fast = fast?.next
    }
    
    
    while (fast != nil) {
        slow = slow?.next
        fast = fast?.next
    }
    slow?.next = slow?.next?.next
    return newHead.next
    
}

//Leetcode 206
func reverseList(_ head: ListNode?) -> ListNode? {
    var prev: ListNode?
    var current = head
    
    while current != nil {
        let tempNext = current?.next
        current?.next = prev
        prev = current
        
        current = tempNext
    }
    
    return prev
}

//Leetcode 206

func oddEvenList(_ head: ListNode?) -> ListNode? {
    if head == nil {
        return nil
    }
    var oddNode = head
    var evenNode = head?.next
    var evenHead = evenNode

    while evenNode != nil && evenNode?.next != nil{
        oddNode?.next = evenNode?.next
        oddNode = oddNode?.next
        evenNode?.next = oddNode?.next
        evenNode = evenNode?.next
    }
    
    oddNode?.next = evenHead
    return head
}

//Leetcode 234

func isPalindrome(_ head: ListNode?) -> Bool {
      var slow = head
      var fast = head
      
      while fast?.next != nil && fast?.next?.next != nil {
          slow = slow?.next
          fast = fast?.next?.next
      }
      print(slow?.value)
      var reversed = reversedLinkedList(head: slow?.next)
      var head = head
      
      print(reversed?.value)
      print(head?.value)
      
      print(reversed?.next?.value)
      print(head?.next?.value)
      while reversed != nil {
          if reversed?.value != head?.value {
              return false
          }
          
          reversed = reversed?.next
          head = head?.next
      }
      
      return true
  }
  
  func reversedLinkedList( head: ListNode?) -> ListNode? {
      var prev:ListNode?
      var current = head
      
      while current != nil {
          var tempNext = current?.next
          current?.next = prev
          prev = current
          current = tempNext
      }
      
      return prev
  }

//Leetcode 21
func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var l1 = l1, l2 = l2
    
    let head = ListNode(value: -1)
    var current = head
    
    while let val1 = l1?.value, let val2 = l2?.value {
        if val1 > val2 {
            current.next = l2
            l2 = l2?.next
        } else {
            current.next = l1
            l1 = l1?.next
        }
        current = current.next!
    }
    if l1 == nil {
        current.next = l2
    } else {
        current.next = l1
    }
    
    return head.next
}

//Leetcode 2
func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var carry: Int = 0
    let head = ListNode(value: -1)
    var dummy: ListNode? = head
    var i1: ListNode? = l1
    var i2: ListNode? = l2
    
    while i1 != nil || i2 != nil {
        var v1 = 0
        var v2 = 0
        if let val = i1?.value {
            v1 = val
        }
        
        if let val = i2?.value {
            v2 = val
        }
        
        let sum = v1 + v2 + carry
        dummy?.next = ListNode(value: sum % 10)
        carry = sum / 10
        
        i1 = i1?.next
        i2 = i2?.next
        dummy = dummy?.next
    }
    
    if carry != 0 {
        dummy?.next = ListNode(value: carry)
    }
    
    return head.next
}


//Leetcode 430 
func flatten(_ head: Node?) -> Node? {
           if head == nil { return head }
      
      var p = head
      while p != nil {
          // case 1: No child, proceed
          if p?.child == nil {
              p = p?.next
              continue
          }
          
          // case 2: got child, find the tail of the child and link it to p.next
          var temp = p?.child
          
          //find the tail of the child
          while temp?.next != nil {
              temp = temp?.next
          }
          
          // connect tail with p.net, if it is not null
          temp?.next = p?.next
          
          if p?.next != nil { p?.next!.prev = temp }
          
          //connect p with p.child, and remove p.child
          p?.next = p?.child
          p?.child?.prev = p
          p?.child = nil
      }
      return head
  }
