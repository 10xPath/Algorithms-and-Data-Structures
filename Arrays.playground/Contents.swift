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

//Leetcode 88

func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var indexM = m - 1
    var indexN = n - 1
    var endIndexNums = m + n - 1
    
    while endIndexNums >= 0 && indexN >= 0 {
        if indexM >= 0 && nums1[indexM] > nums2[indexN] {
            nums1[endIndexNums] = nums1[indexM]
            nums1[indexM] = nums2[indexN]
            indexM -= 1
        } else {
            nums1[endIndexNums] = nums2[indexN]
            indexN -= 1
        }
        
        endIndexNums -= 1
        
    }
}

//Leetcode 27

func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    var endIndex = nums.count
    var startIndex = 0
    while startIndex < endIndex {
        if nums[startIndex] == val{
            nums[startIndex] = nums[endIndex - 1]
            endIndex -= 1
        } else {
            startIndex += 1
        }
    }
    
    return endIndex
}


//Leetcode 26

func removeDuplicates(_ nums: inout [Int]) -> Int {
    
    if nums.count <= 1 {
        return nums.count
    }
    var firstIndex = 0
    var secondIndex = 1
    
    while secondIndex < nums.count {
        if nums[firstIndex] != nums[secondIndex] {
            nums[firstIndex + 1] = nums[secondIndex]
            firstIndex += 1
        }
        secondIndex += 1
    }
    
    return firstIndex + 1
}

//Leetcode 1346

func checkIfExist(_ arr: [Int]) -> Bool {
    var lookupDictionary: [Int:Int] = [:]
    
    for firstIndex in 0..<arr.count {
        
        for secondIndex in firstIndex + 1..<arr.count {
            if let product = lookupDictionary[arr[secondIndex]] {
                return true
            } else {
                lookupDictionary[arr[firstIndex] * 2] = arr[firstIndex]
            }
            
            if arr[firstIndex] / 2 == arr[secondIndex] && arr[firstIndex] % 2 == 0 {
                print(arr[firstIndex])
                print(arr[secondIndex])
                return true
            }
        }
        
    }
    
    return false
}


//Leetcode 1299

func replaceElements(_ arr: [Int]) -> [Int] {
    var mutableArr = arr
    if arr.count == 0 {
        return arr
    }
    for firstIndex in 0..<arr.count - 1 {
        var maxElement = Int.min
        for secondIndex in firstIndex + 1..<arr.count {
            maxElement = mutableArr[secondIndex] > maxElement ? mutableArr[secondIndex] : maxElement
        }
        mutableArr[firstIndex] = maxElement
    }
    
    mutableArr[arr.count - 1] = -1
    
    return mutableArr
}

//Leetcode 283

func moveZeroes(_ nums: inout [Int]) {
    var firstIndex = 0
    var secondIndex = 1
    
    while secondIndex < nums.count {
        if nums[firstIndex] == 0 && nums[secondIndex] != 0 {
            nums[firstIndex] = nums[secondIndex]
            nums[secondIndex] = 0
            firstIndex += 1
        }
        
        if nums[firstIndex] != 0 {
            firstIndex += 1
        }
        
        secondIndex += 1
    }
}

//Leetcode 905

func sortArrayByParity(_ A: [Int]) -> [Int] {
    var mutableArray = A
    var firstIndex = 0
    var secondIndex = 1
    
    while (secondIndex < mutableArray.count) {
        if mutableArray[firstIndex] % 2 != 0 && mutableArray[secondIndex] % 2 == 0 {
            var firstIndexTemp = mutableArray[firstIndex]
            mutableArray[firstIndex] = mutableArray[secondIndex]
            mutableArray[secondIndex] = firstIndexTemp
            
            firstIndex += 1
        }
        
        if mutableArray[firstIndex] % 2 == 0 {
            firstIndex += 1
        }
        
        secondIndex += 1
    }
    
    return mutableArray
}


//Leetcode 977
 func sortedSquaresVersionTwo(_ A: [Int]) -> [Int] {
      

      var results: [Int] = []
      
       if A.count < 2 {
          return [A[0] * A[0]]
      }
      var leftIndex = 0
      var rightIndex = 1
      for i in 0..<A.count {
          if A[i] < 0 && A[i + 1] >= 0 {
              leftIndex = i
              rightIndex = i + 1
          }
      }
      
      while leftIndex >= 0 && rightIndex < A.count {
          var rightIndexSquared = A[rightIndex] * A[rightIndex]
          var leftIndexSquared = A[leftIndex] * A[leftIndex]
          if rightIndexSquared > leftIndexSquared {
              results.append(leftIndexSquared)
              leftIndex -= 1
          } else {
              results.append(rightIndexSquared)
              rightIndex += 1
          }
      }
  
      while rightIndex < A.count {
          results.append(A[rightIndex] * A[rightIndex])
          rightIndex += 1
      }
      
      while leftIndex >= 0 {
          results.append(A[leftIndex] * A[leftIndex])
          leftIndex -= 1
      }
      return results
  }

//Leetcode 1051
func heightChecker(_ heights: [Int]) -> Int {
       var sortedHeights = heights.sorted()
       var moveCount = 0
       for i in 0..<heights.count {
           if heights[i] != sortedHeights[i] {
               moveCount += 1
           }
       }
       
       return moveCount
   }

//Leetcode 487
func findMaxConsecutiveOnesTwo(_ nums: [Int]) -> Int {
      var maxLength = 0
      var zero = 0
      
      var j=0
      
      for i in 0..<nums.count {
          if(nums[i]==0){
              zero += 1
          }
          
          while(zero>1){
              if(nums[j]==0){
                  zero -= 1
              }
              j += 1
          }
          maxLength = i - j + 1 > maxLength ? i - j + 1 : maxLength
      }
      
      return maxLength
  }

//Leetcode 414

func thirdMax(_ nums: [Int]) -> Int {
     var maxNum = Int.min
     
     //Get maxNum
     for num in nums {
         maxNum = num > maxNum ? num : maxNum
     }
     
     var secondMax = Int.min
     for num in nums {
         if num < maxNum && num > secondMax {
             secondMax = num
         }
     }
     
     var thirdMax = Int.min
     
     for num in nums {
         if num < secondMax && num > thirdMax {
             thirdMax = num
         }
     }
     
     if thirdMax != Int.min {
         return thirdMax
     } else {
         return maxNum
     }
 }

//Leetcode 448

func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
    
    if nums.isEmpty {
        return nums
    }
    var numSet: Set<Int> = Set<Int>()
    for i in 1...nums.count {
        numSet.insert(i)
    }
    
    for num in nums {
        numSet.remove(num)
    }
    
    return Array(numSet)
}


func findDisappearedNumbersIndex(_ nums: [Int]) -> [Int] {
       
       if nums.isEmpty {
           return []
       }
       var numsCopy = nums
       var results:[Int] = []
       for i in 0..<nums.count {
           let index = abs(numsCopy[i]) - 1
           if numsCopy[index] > 0 {
               numsCopy[index] = numsCopy[index] * -1
           }
           
       }
       
       for i in 0..<numsCopy.count {
           if numsCopy[i] > 0 {
               results.append(i + 1)
           }
       }
       
       return results
   }




