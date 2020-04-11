import UIKit

var str = "Hello, playground"


private func quickSort() {
  var array = [-2, -7, 2, -2, 0]
    
    var positiveArray:[Int] = []
    
    for num in array {
        positiveArray.append(abs(num))
    }
  array = quickSortHelper(array: positiveArray)
  var firstIterator = 0
  var secondIterator = firstIterator + 1
  while ((firstIterator < array.count - 1) && (secondIterator < array.count)) {
    if abs(array[firstIterator]) == abs(array[secondIterator]) {
       if array[secondIterator] < array[firstIterator] {
         let tempFirstIterator = array[firstIterator]
         array[firstIterator] = array[secondIterator]
         array[secondIterator] = tempFirstIterator
       }
    }
  
    firstIterator = firstIterator + 1
    secondIterator = secondIterator + 1
  }
  
  print(array)
}

private func quickSortHelper(array: [Int]) -> [Int] {
    print("Count of array being partitioned \(array.count) for array \(array)")
   guard array.count > 1 else { return array }
   
   let pivotPoint = array[array.count/2]
   let lessThan = array.filter{($0 < pivotPoint)}
   let equalTo = array.filter{($0 == pivotPoint)}
   let moreThan = array.filter{($0 > pivotPoint)}
                               
  // return quickSortHelper(array:lessThan) + quickSortHelper(array: equalTo) + quickSortHelper(array: moreThan)
}

quickSort()
