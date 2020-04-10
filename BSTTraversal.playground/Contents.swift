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

//O(l + r) Run time
//O(l + r) Space time
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

//O(l + r) Run time
//O(l + r) Space time
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


//O(l + r ) Run time
//(l + r) Space Time
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

//O(log(n)) Run time
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

//1. O(log(n) Run time complexity
//2. O(n) Space time complxiety

func countFreqOfKeyRecursion(tree: BST?, forKey: Int) -> Int {
    
    if let currentNode = tree {
        if let nodeValue = currentNode.value {
            if nodeValue == forKey {
                return countFreqOfKey(tree: currentNode.right, forKey: forKey) + 1
            } else if forKey < nodeValue {
                return countFreqOfKey(tree: currentNode.left, forKey: forKey)
            } else {
                return countFreqOfKey(tree: currentNode.right, forKey: forKey)
            }
        }
    } else {
        return 0
    }
    
    return 0
}

//4. To find the max sum nodes in a path from root to leaf in a BST

// Run Time O(n^2)
// Space Complexity O(n) because of recursion

let sampleTree = BST(value: 15).insert(value: 10).insert(value: 9).insert(value: 5).insert(value: 13).insert(value: 25).insert(value: 18).insert(value: 36)
print(sampleTree.right?.value)
func getMaxSumInPaths(tree: BST?, pathSum: Int) -> Int {
    print("Starting at \(tree?.value)")
    if tree?.left == nil && tree?.right == nil {
        return pathSum
    } else {
        guard let leftNode = tree?.left, let leftNodeValue = leftNode.value else {
           return pathSum
        }
        
        guard let rightNode = tree?.right, let rightNodeValue = rightNode.value else {
           return pathSum
        }
        
        let maxLeft = getMaxSumInPaths(tree: leftNode, pathSum: pathSum + leftNodeValue)
        let maxRight = getMaxSumInPaths(tree: rightNode, pathSum: pathSum + rightNodeValue)
        
        return maxLeft > maxRight ? maxLeft : maxRight
    }

}

getMaxSumInPaths(tree: sampleTree, pathSum: sampleTree.value ?? 0)


//**
// * Definition for a binary tree node.
// * public class TreeNode {
// *     public var val: Int
// *     public var left: TreeNode?
// *     public var right: TreeNode?
// *     public init(_ val: Int) {
// *         self.val = val
// *         self.left = nil
// *         self.right = nil
// *     }
// * }
// */

//func closestValue(_ root: TreeNode?, _ target: Double) -> Int {
//
//       return closestValueHelper(root: root, target: target, minDifference: Double.greatestFiniteMagnitude, minDifferenceNodeValue: Int.max)
//   }
//
//   func closestValueHelper(root: TreeNode?, target: Double, minDifference: Double, minDifferenceNodeValue: Int) -> Double {
//
//       if root == nil {
//           return minDifferenceNodeValue
//       } else {
//           if let nodeValue = root.val as? Double {
//               let currentDifference = abs(nodeValue - target)
//               var minDiff = minDifference
//               var minDiffNode = minDifferenceNodeValue
//               if currentDifference < minDifference {
//                   minDiff = currentDifference
//                   minDiffNode = nodeValue as? Int ?? Double.greatestFinitMagnitude
//               }
//
//               if target > nodeValue {
//                     closestValueHelper(root: root.right, target: target, minDifference: minDiff, minDifferenceNodeValue: minDiffNode)
//                   } else {
//                     closestValueHelper(root: root.left, target: target, minDifference: minDiff, minDifferenceNodeValue: minDiffNode)
//                   }
//           }
//       }
//   }
