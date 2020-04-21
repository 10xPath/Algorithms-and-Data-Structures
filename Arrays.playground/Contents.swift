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

//Leetcode 1295
func findNumbers(_ nums: [Int]) -> Int {
    var evenCount = 0
    for num in nums {
        if countDigits(num: num) % 2 == 0 {
            evenCount += 1
        }
    }
    
    return evenCount
}

func countDigits(num: Int) -> Int {
    if num < 100000 && num > 9999 {
        return 5
    } else if num < 10000 && num > 999 {
        return 4
    } else if num < 1000 && num > 99 {
        return 3
    } else if num < 100 && num > 9 {
        return 2
    } else {
        return 1
    }
}

//Leetcode 977
func sortedSquares(_ A: [Int]) -> [Int] {
    var squaredArray: [Int] = []
    
    for element in A {
        squaredArray.append(element*element)
    }
    
    return squaredArray.sorted()
    
}

//Optimized approach


