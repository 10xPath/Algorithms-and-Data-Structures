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

func countFreqOfKeyRecursion(tree: BST?, forKey: Int) -> Int {
    var count = 0
    let currentNode = tree
    countFreqOfKeyRecursionHelper(tree: currentNode, forKey: forKey, forCount: &count)
    return count
    
}

//1. Write a recursive function that returns the frequency of a key given as input in a BST
//O(log(n)) Run time
//O(log(n)) Space time
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
    }
}

//2.To find the unique path in a Binary tree
func getUniquePathsInBST(tree: BST?) -> [[Int]] {
    var paths: [[Int]] = []
    var path: [Int] = []
    getUniquePathsInBSTHelper(tree: tree, paths: &paths, path: &path)
    
    return paths
}


// O(n) run time
// O(n) space time

func getUniquePathsInBSTHelper(tree: BST?, paths: inout [[Int]], path: inout [Int]) {
    
    if let currentNode = tree {
        if let nodeValue = currentNode.value {
            path.append(nodeValue)
        }
        
        if currentNode.left == nil && currentNode.right == nil {
            paths.append(path)
        } else {
            if let leftNode = currentNode.left {
                getUniquePathsInBSTHelper(tree: leftNode, paths: &paths, path: &path)
            }
            
            if let rightNode = currentNode.right {
                getUniquePathsInBSTHelper(tree: rightNode, paths: &paths, path: &path)
            }
        }
    }
}

//4. To find the max sum nodes in a path from root to leaf in a BST

// Run Time O(n^2)
// Space Complexity O(n) because of recursion
func getMaxSumInPaths(tree: BST?) -> Int {
    //getPaths
    //getMaxSumFromPaths
    var maxSum = 0
    var uniquePaths: [[Int]] = []
    var path: [Int] = []
    
    getUniquePathsInBSTHelper(tree: tree, paths: &uniquePaths, path: &path)
    
    maxSum = getMaxSumFromPaths(uniquePath: uniquePaths)
    return maxSum
}

func getUniquePathsInTree(tree: BST?, uniquePaths: inout [[Int]], path: inout[Int]) -> [[Int]] {
    if let currentNode = tree {
        if let nodeValue = currentNode.value {
            path.append(nodeValue)
        }
        if currentNode.left == nil && currentNode.right == nil {
            uniquePaths.append(path)
        } else {
            if let leftNode = currentNode.left {
                getUniquePathsInTree(tree: leftNode, uniquePaths: &uniquePaths, path: &path)
            }
            
            if let rightNode = currentNode.right {
                getUniquePathsInTree(tree: rightNode, uniquePaths: &uniquePaths, path: &path)
            }
        }
    }
    return []
}


//
func getMaxSumFromPaths(uniquePath:[[Int]]) -> Int {
    var maxSum = 0
    var currentSum = 0
    
    for path in uniquePath {
        maxSum = currentSum > maxSum ? currentSum : maxSum
        currentSum = 0
        for element in path {
            currentSum = currentSum + element
        }
    }
    
    return maxSum
}


