import UIKit

class BST {
    var value: Int?
    var left: BST?
    var right: BST?
    
    init(value: Int) {
        self.value = value
        left = nil
        right = nil
    }
    
    func insert(value: Int) -> BST {
        if let nodeValue = self.value {
            if value < nodeValue {
                if let leftNode = self.left {
                    leftNode.insert(value:value)
                } else {
                    self.left = BST(value: value)
                }
            } else {
                if let rightNode = self.right {
                    rightNode.insert(value: value)
                } else {
                    self.right = BST(value: value)
                }
            }
        }
        return self
    }
    
}

//O(n) Run time
//O(n) Space time
func inOrderTraversal(tree: BST?, array: inout [Int]) -> [Int] {
    if let node = tree {
        inOrderTraversal(tree: node.left, array: &array)
        if let value = node.value {
            array.append(value)
        }
        
        inOrderTraversal(tree: node.right, array: &array)
    }
    return array
}

//O(n) Run time
//O(n) Space time
func preOrderTraversal(tree: BST?, array: inout [Int]) -> [Int] {
    if let node = tree {
        if let value = node.value {
            array.append(value)
        }
        preOrderTraversal(tree: node.left, array: &array)
        preOrderTraversal(tree: node.right, array: &array)
    }
    return array
}


//O(n) Run time
//(n) Space Time
func postOrderTraversal(tree: BST?, array: inout [Int]) -> [Int] {
    if let node = tree {
        postOrderTraversal(tree: node.left, array: &array)
        postOrderTraversal(tree: node.right, array: &array)
        if let value = node.value {
            array.append(value)
        }
    }
    
    return array
}

//O(n) Run time
//O(1) Space time
func countFreqOfKey(tree: BST?, forKey: Int) -> Int {
    var count = 0
    var currentNode = tree
    
    while let node = currentNode {
        
        if let nodeValue = node.value {
            if forKey == nodeValue {
                count = count + 1
            }
            
            if forKey < nodeValue {
                if let leftNode = node.left {
                    currentNode = leftNode
                } else {
                    return count
                }
            } else {
                if let rightNode = node.right {
                    currentNode = rightNode
                } else {
                    return count
                }
            }
        }
    }
    
    return count
}

func countFreqOfKeyRecursion(tree: BST?, forKey: Int) -> Int {
    var count = 0
    let currentNode = tree
    countFreqOfKeyRecursionHelper(tree: currentNode, forKey: forKey, forCount: &count)
    return count
     
}

//O(n) Run time
//O(n) Space time
func countFreqOfKeyRecursionHelper(tree: BST?, forKey: Int, forCount: inout Int)  {
    if let currentNode = tree {
        if let nodeValue = currentNode.value {
            if nodeValue == forKey {
                forCount = forCount + 1
            }
            
            if forKey < nodeValue {
                countFreqOfKeyRecursionHelper(tree: currentNode.left, forKey: forKey, forCount: &forCount)
            } else {
                countFreqOfKeyRecursionHelper(tree: currentNode.right, forKey: forKey, forCount: &forCount)
            }
        }
    } else {
        return forCount
    }
}



