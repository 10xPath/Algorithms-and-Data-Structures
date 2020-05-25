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

//MARK: 3.1

var directions: [[Int]] = [[1,0],[-1,0],[0,1],[0,-1]]
var matrixGrid: [[Int]] = []
var cellCount = 0
var visitedGrid: [[Bool]] = []
func countNumberOfCellsInMatrixDFSRecursion(grid:[[Int]]) -> Int {
    let rows = grid.count
    let columns = grid[0].count
    matrixGrid = grid
    let visitedRow = Array(repeating: false, count: matrixGrid.count)
    let visited:[[Bool]] = Array(repeating: visitedRow, count: grid[0].count)
    visitedGrid = visited
    for row in 0..<rows {
        for column in 0..<columns {
            if grid[row][columns] == 1 {
                cellCounterDFSRecursion(row: row, column: column)
            }
        }
    }
    
    return cellCount
}

func cellCounterDFSRecursion(row: Int, column: Int) {
    
    cellCount += 1
    visitedGrid[row][column] = true

    for direction in directions {
        let newRow = row + direction[0]
        let newColumnn = column + direction[1]
        if visitedGrid[row][column] == false && validateCell(row: newRow, column: newColumnn) {
            cellCounterDFSRecursion(row: newRow, column: newColumnn)
        }
    }
}

func validateCell(row: Int, column: Int) -> Bool {
    if row < 0 || column < 0 || row >= matrixGrid.count || column >= matrixGrid[0].count {
        return false
    }
    
    if matrixGrid[row][column] != 1 {
        return false
    }
    
    return true
    
}

//MARK: 3.2

func countNumberOfCellsInMatrixDFSStack(grid:[[Int]]) -> Int {
    if grid.count == 0 {
        return 0
    }
    
    let rows = grid.count
    let columns = grid[0].count
    let visitedRow = Array(repeating: false, count: columns)
    let visited:[[Bool]] = Array(repeating: visitedRow, count: rows)
    var count = 0
    
    for row in 0..<rows {
        for column in 0..<columns {
            if visited[row][column] == false && grid[row][column] == 1 {
                var stack:[[Int]] = [[row,column]]
            
                if !stack.isEmpty {
                    let currentCell = stack.removeLast()
                    
                    for direction in directions {
                        let newRow = direction[0] + currentCell[0]
                        let newColumn = direction[1] + currentCell[1]
                        if isValidateed(row: newRow, column: newColumn, grid: grid) && visited[newRow][newColumn] == false {
                            count += 1
                            visited[newRow][newColumn] == true
                        }
                        
                    }
                }
                
            }
        }
    }
    
    return count
}

func isValidateed(row: Int, column: Int, grid: [[Int]]) -> Bool {
    if row < 0 || row >= grid.count || column < 0 || column >= grid[0].count {
        return false
    }
    
    return true
}

//MARK: 3.3
func countNumberOfCellsInMatrixBFS(grid:[[Int]]) -> Int {
    if grid.count == 0 {
        return 0
    }
    
    let rows = grid.count
    let columns = grid[0].count
    let visitedRow = Array(repeating: false, count: columns)
    let visited:[[Bool]] = Array(repeating: visitedRow, count: rows)
    var count = 0
    
    for row in 0..<rows {
        for column in 0..<columns {
            if visited[row][column] == false && grid[row][column] == 1 {
                var queue:[[Int]] = [[row,column]]
            
                if !queue.isEmpty {
                    let currentCell = queue.removeFirst()
                    
                    for direction in directions {
                        let newRow = direction[0] + currentCell[0]
                        let newColumn = direction[1] + currentCell[1]
                        if isValidateed(row: newRow, column: newColumn, grid: grid) && visited[newRow][newColumn] == false {
                            count += 1
                            visited[newRow][newColumn] == true
                        }
                        
                    }
                }
                
            }
        }
    }
    
    return count
}



