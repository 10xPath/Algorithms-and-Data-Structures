import UIKit

let input = [[1,2],[4,3]]

func spiralTraverse(array: [[Int]]) -> [Int] {
               if array.count == 0 {
                   return []
               }
       var paths: [Int] = []
               var nStart = 0 , nEnd = array.count - 1
               var mStart = 0 , mEnd = array[0].count - 1
           
               while nStart <= nEnd && mStart <= mEnd {
                
                
                   for m in stride(from: mStart, through: mEnd, by: 1) {
                       print("1st Adding \(array[nStart][m])")
                       paths.append(array[nStart][m])
                   }
                   
                for n in stride(from:nStart + 1 , through: nEnd, by: 1) {
                       print("2nd Adding \(array[n][mEnd])")
                       paths.append(array[n][mEnd])
                   }
                   
                
                for m in stride(from: mEnd - 1, through: mStart, by: -1){
                    if nStart == nEnd {
                        break
                    }
                       paths.append(array[nEnd][m])
                   }
                
                for n in stride(from: nEnd - 1 , through: nStart + 1, by: -1){
                    if mStart == mEnd else {
                        break 
                    }
                       paths.append(array[n][mStart])
                   }
                
                   nStart += 1
                   nEnd -= 1
                   mStart += 1
                   mEnd -= 1
               }
           
       return paths
    
}




spiralTraverse(array: [[1,2,3,4],
                          [10,11,12,5],
                          [9,8,7,6]])

spiralTraverse(array: [[1,2],[4,3]])
