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


