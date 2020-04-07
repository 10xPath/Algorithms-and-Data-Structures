import UIKit

var str = "Hello, playground"


var nums = [1,2,3]

//3. To find the subsets of an array of integers
func getSubsets(nums: [Int]) -> [[Int]] {
    
    var results: [[Int]] = []
    var subArray: [Int] = []
    let index = 0
    
    if nums.count == 0 {
        return results
    }
    
    getSubsetsHelper(nums: nums, results: &results, subArray: &subArray, startIndex: index)
    return results
}

// O(n) ?
// O(n)
func getSubsetsHelper(nums: [Int], results: inout [[Int]], subArray: inout [Int], startIndex: Int) {
    print("Adding \(subArray) to results that has \(results) at recusion number \(startIndex)")
    results.append(subArray)
    
    for i in startIndex..<nums.count {
        print("Adding \(nums[i]) to subarray that has \(subArray) at loop \(i)")
        subArray.append(nums[i])
        getSubsetsHelper(nums: nums, results: &results, subArray: &subArray, startIndex: i + 1)
        subArray.removeLast()
    }
}


print(getSubsets(nums: nums))



