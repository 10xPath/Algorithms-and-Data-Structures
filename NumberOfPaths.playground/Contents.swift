import UIKit

var str = "Hello, playground"


//5. Write a recursive function that takes a variable n and returns the number of paths in a grid of size n*n starting from (0,0) to (n-1,n-1). (n doesn’t bypass 8)

//O(n^2) Run time complexity
//O(n^2) Space time
func findNumberofPaths(n: Int) -> Int {
    if n > 8 {
        return 0
    }
    
    return findNumberOfPathsHelper(endPoint: n - 1, c: 0, r: 0)

}

func findNumberOfPathsHelper(endPoint:Int, c: Int, r: Int) -> Int {
    if c > endPoint || r > endPoint {
        return 0
    }
    
    if (c == endPoint && r == endPoint) {
        return 1
    } else {
        return findNumberOfPathsHelper(endPoint: endPoint, c: c + 1, r: r) + findNumberOfPathsHelper(endPoint: endPoint,c: c, r: r + 1)
        
    }
}

findNumberofPaths(n: 3)
