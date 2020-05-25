import UIKit

var str = "Hello, playground"


//Given an adjacency list, and the number of nodes n write 3 solutions:
//a dfs with recursion,  a dfs with stack and bfs with queue to count the number of nodes in starting from node 0.


//MARK: 1.1 DFS Recursion

var nodeCounterDFS = 0
var adjListDSF:[Int:[Int]] = [:]
func countNumberOfNodesDFSRecursion(adjList:[Int:[Int]], startingPoint: Int) -> Int {
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



//MARK:1.2 DFS Stack

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

//MARK: 1.3 BFS
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


//MARK: 2.1

func isConnectedGraphDFSRecursion(adjList:[Int:[Int]], startingPoint: Int) {
    adjListDSF = adjList
    
    nodeCounterDFSRecursion(0)
    
    let isConnected = nodeCounterDFS == adjList.count ? "YES" : "NO"
    
    print(isConnected)
}


//MARK: 2.2
func isConnectedGraphDFSStack(adjList:[Int:[Int]], startingPoint: Int) {
    var nodeCounter = 0
       
       if adjList.count == 0 {
           print("NO")
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
       
    let isConnected = nodeCounter == adjList.count ? "YES" : "NO"
    
    print(isConnected)
}

//MARK: 2.3
func isConnectedGraphBFS(adjList: [Int:[Int]], startingPoint: Int) {
    var nodeCounter = 0
       
       if adjList.count == 0 {
           print("NO")
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
       
    let isConnected = nodeCounter == adjList.count ? "YES" : "NO"
    
    print(isConnected)
}




