import UIKit

var str = "Hello, playground"


//Leetcode 485
func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
    var counter = 0
    var maxCount = Int.min
    for i in 0..<nums.count {
        counter += 1
        if nums[i] == 0 {
            counter = 0
        }
        
        maxCount = max(maxCount, counter)
    
    }
    
    return maxCount
}


