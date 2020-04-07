import UIKit

var str = "Hello, playground"


//5. Write a recursive function that takes a variable n and returns the number of paths in a grid of size n*n starting from (0,0) to (n-1,n-1). (n doesn’t bypass 8)

//O(n^2) Run time complexity
//O(n^2) Space time
func findNumberofPaths(n: Int) -> Int {
    if n > 8 {
        return 0
    }
    
    var paths = 0
    var x = 0
    var y = 0
    
    findNumberOfPathsHelper(endPoint: n - 1, paths: &paths, x: x, y: y)
    return paths
}

func findNumberOfPathsHelper(endPoint:Int, paths: inout Int, x: Int, y: Int) {
    if x > endPoint || y > endPoint {
        return
    }
    if (x == endPoint && y == endPoint) {
        paths = paths + 1
    } else {
        findNumberOfPathsHelper(endPoint: endPoint, paths: &paths, x: x + 1, y: y)
        findNumberOfPathsHelper(endPoint: endPoint, paths: &paths, x: x, y: y + 1)
    }
}

findNumberofPaths(n: 4)
