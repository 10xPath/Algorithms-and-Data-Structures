import UIKit

var str = "Hello, playground"


//Given an adjacency list, and the number of nodes n write 3 solutions:
//a dfs with recursion,  a dfs with stack and bfs with queue to count the number of nodes in starting from node 0.


//MARK: DFS Recursion

var nodeCounterDFS = 0
var adjListDSF:[Int:[Int]] = [:]
func countNumberOfNodesDFSRecursion(adjList:[Int:[Int]], startingPoint: Int) -> Int {
    nodeCounterDFS = 0
    adjListDSF = adjList
    if adjList.count == 0 {
        return 0
    }
    
    nodeCounterDFSRecursion(0)
    
    return nodeCounterDFS
}

func nodeCounterDFSRecursion(_  node: Int) {
    nodeCounterDFS += 1
    let neighbors = adjListDSF[node]!
    
    for neighbor in neighbors {
        nodeCounterDFSRecursion(neighbor)
    }
}



//MARK: DFS Stack

func countNumberOfNodesDFSStack(adjList:[Int:[Int]], startingPoint: Int) -> Int {
    var nodeCounter = 0
    
    if adjList.count == 0 {
        return 0
    }
    
    var stack = [startingPoint]
    
    if !stack.isEmpty {
        nodeCounter += 1
        let currentNode = stack.removeLast()
        let neighbors = adjList[currentNode]!
        for neighbor in neighbors {
            stack.append(neighbor)
        }
    }
    
    return nodeCounter
}

//MARK: BFS
func countNumberOfNodesBFS(adjList: [Int:[Int]], startingPoint: Int) -> Int{
    
    var nodeCounter = 0
    
    if adjList.count == 0 {
        return 0
    }
    
    var queue = [startingPoint]
    
    if !queue.isEmpty {
        nodeCounter += 1
        let currentNode = queue.removeFirst()
        let neighbors = adjList[currentNode]!
        for neighbor in neighbors {
            queue.append(neighbor)
        }
    }
    
    return nodeCounter
}


