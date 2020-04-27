import UIKit

var str = "Hello, playground"


class MyLinkedList {
    
    var head:ListNode?
    
    class ListNode {
        var next: ListNode?
        var value: Int?
        
        init(value: Int) {
            self.value = value
        }
    }

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


