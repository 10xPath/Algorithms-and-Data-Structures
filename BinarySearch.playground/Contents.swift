import UIKit

var str = "Hello, playground"

var array = [1,2,3,4,5,6,7,8,9]
var arrayTwo = [0,1,21,33,45,61,71,72,73]

func binarySearch(array: [Int], target: Int) -> Int {
    return binarySearchHelper(array: array, target: target, startIndex: 0, endIndex: array.count - 1)
}

func binarySearchHelper(array: [Int], target: Int, startIndex: Int, endIndex: Int) -> Int {
    let middleIndex = (endIndex - startIndex)/2
    if array.count == 0 {
        return -1
    }
    
    let intArray : [Int] = []
    
    intArray.removeL
    
    array.firstIndex(of: <#T##Int#>)
    var dictionary: [String: String] = [:]
    for (index, element) in dictionary {
        
    }
    if array[middleIndex] == target {
        return middleIndex
    } else if array[middleIndex] < target {
        return binarySearchHelper(array: array, target: target, startIndex: middleIndex, endIndex: array.count - 1)
    } else {
        return binarySearchHelper(array: array, target: target, startIndex: 0, endIndex: middleIndex )
    }
}

binarySearch(array: arrayTwo, target: 33)

