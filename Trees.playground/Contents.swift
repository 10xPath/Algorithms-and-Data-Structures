import UIKit

var str = "Hello, playground"

 public class TreeNode {
     public var val: Int
     public var left: TreeNode?
     public var right: TreeNode?
     public init(_ val: Int) {
         self.val = val
         self.left = nil
         self.right = nil
     }
 }

//Leetcode 102
func levelOrder(_ root: TreeNode?) -> [[Int]] {
    var queue: [TreeNode] = []
    if let root = root {
        queue = [root]
    } else {
        return []
    }
    
    var results: [[Int]] = []

    while queue.count != 0 {
        var result: [Int] = []
        for i in 0..<queue.count {
            let currentNode = queue.removeFirst()
            print(currentNode.val)
            result.append(currentNode.val)

            if let leftNode = currentNode.left {
                queue.append(leftNode)
            }
            
            if let rightNode = currentNode.right {
                queue.append(rightNode)
            }
        }
        
        results.append(result)
    }
    
    return results
}


//Leetcode 104 
func maxDepth(_ root: TreeNode?) -> Int {
    if root == nil {
        return 0
    }
    
    let leftDepth = maxDepth(root?.left)
    let rightDepth = maxDepth(root?.right)
    
    return leftDepth > rightDepth ? leftDepth + 1 : rightDepth + 1
}
