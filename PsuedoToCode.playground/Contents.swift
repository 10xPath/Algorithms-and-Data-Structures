import UIKit

   //Initialize our result with all 0s
    var ans: [Int] = Array(repeating: 0, count: T.count)

    var stack: [Int] = []
    
    for index in stride(from: T.count - 1, through: 0, by: -1) {
        while(!stack.isEmpty && T[index] >= T[stack.last!]) {
            stack.removeLast()
        }
        
        if stack.isEmpty {
            ans[index] = 0
        } else {
            stack.last - index
        }
        stack.append(index)
    }
    
    return ans
