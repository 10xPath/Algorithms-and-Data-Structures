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

//Leetcode 977 On(Logn)
func sortedSquares(_ A: [Int]) -> [Int] {
    var squaredArray: [Int] = []
    
    for element in A {
        squaredArray.append(element*element)
    }
    
    return squaredArray.sorted()
    
}

//Optimized approach O(n)


func sortedSquaresOptimized(_ A: [Int]) -> [Int] {
    var negativeSorted: [Int] = []
    var positiveSorted: [Int] = []
    var mergedSorted: [Int] = []
    
    for element in A {
        if element < 0 {
            negativeSorted.append(element)
        } else {
            positiveSorted.append(element)
        }
    }
    
    var negativeArrayIndex = negativeSorted.count - 1
    var positiveSortedIndex = 0
    
    while negativeArrayIndex >= 0 && positiveSortedIndex < positiveSorted.count {
        let negativeArrValue = negativeSorted[negativeArrayIndex] * negativeSorted[negativeArrayIndex]
        let positiveArrValue = positiveSorted[positiveSortedIndex] * positiveSorted[positiveSortedIndex]
        if negativeArrValue < positiveArrValue {
            mergedSorted.append(negativeArrValue)
            negativeArrayIndex -= 1
        } else {
            mergedSorted.append(positiveArrValue)
            positiveSortedIndex += 1
        }
    }
    
    while negativeArrayIndex >= 0 {
        mergedSorted.append(negativeSorted[negativeArrayIndex] * negativeSorted[negativeArrayIndex])
        negativeArrayIndex -= 1
    }
    
    while positiveSortedIndex < positiveSorted.count {
        mergedSorted.append(positiveSorted[positiveSortedIndex] * positiveSorted[positiveSortedIndex])
        positiveSortedIndex += 1
    }
    
    return mergedSorted
}


//Leetcode 1089

func duplicateZeros(arr: inout [Int]) {
    var i = 0
    while i < arr.count {
        if i >= arr.count {
            return
        }
        if arr[i] == 0 {
            shiftElementsRight(arr: &arr, insertArray: 0, atIndex: i)
            i += 2
        } else {
            i += 1
        }
    }
}

func shiftElementsRight(arr: inout [Int], insertArray: Int,  atIndex: Int) {
    var tempPrev = insertArray
    for i in atIndex..<arr.count {
        let tempCurr = arr[i]
        arr[i] = tempPrev
        tempPrev = tempCurr
    }
}

var numWithZeros = [1,0,2,3,0,4,5,0]

duplicateZeros(arr: &numWithZeros)



