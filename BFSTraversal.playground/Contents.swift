import UIKit

class Node {
    var name: String
    var children: [Node]
    
    init(name: String) {
        self.name = name
        children = []
    }
    
    func addChild(name: String) -> Node {
        let childNode = Node(name: name)
        children.append(childNode)
        
        return self
    }
    
    //First Solution
    func breadthFirstSearch(array: inout [String]) -> [String] {
        if !array.contains(name) {
            array.append(name)
        }
        
        
        for arrayElement in children {
            array.append(arrayElement.name)
            // return arrayElement.breadthFirstSearch(array:&array)
        }
        
        print("Looping below \(name)")
        for arrayElement in children {
            // array.append(arrayElement.name)
            if arrayElement.children.count > 0 {
                return arrayElement.breadthFirstSearch(array:&array)
            }
        }
        
        return array
    }
    
    //Second solution
    
    func breadthFirstSearchQueue(array: inout [String]) -> [String] {
        var queue: [Node] = [self]
        while queue.count > 0 {
            let currentNode = queue.removeFirst()
            array.append(currentNode.name)
            
            for child in currentNode.children {
                queue.append(child)
            }
        }
        return array
    }
    
}
