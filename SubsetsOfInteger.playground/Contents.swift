import UIKit

var str = "Hello, playground"


var nums = [1,2,3]

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

func getSubsetsHelper(nums: [Int], results: inout [[Int]], subArray: inout [Int], startIndex: Int) {
    print("In recursion number \(startIndex)")
    print("Adding \(subArray) to results that has \(results) at startIndex \(startIndex)")
    results.append(subArray)
//    [[], [1], [1, 3], [1, 3, 2]]
    for i in startIndex..<nums.count {
        print("In loop number \(i)")
        print("Adding \(nums[i])")
        subArray.append(nums[i])
        getSubsetsHelper(nums: nums, results: &results, subArray: &subArray, startIndex: startIndex + 1)
        subArray.removeLast()
    }
}

print(getSubsets(nums: nums))



