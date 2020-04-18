import UIKit

var str = "Hello, playground"


//1.Write the fibonacci recursive function without memoization.
//10 -> 144
// 0 + 1 = 1
// 1 + 1 = 2
// 1 + 2 = 3
//
func fibbinaci(n: Int) -> Int {
    if n == 0 {
        return 0
    }
    
    if n == 1 {
        return 1
    }
    
    return fibbinaci(n: n - 1) + fibbinaci(n: n - 2)
}

fibbinaci(n: 10)


//2. Add memoization to the fibonacci function

func fibWithMemoization(n: Int, memo: inout [Int: Int]) -> Int {
    
    if n == 0 {
        return 0
    }
    
    if n == 1 {
        return 1
    }
    
    if let sum = memo[n] {
        return sum
    } else {
        let sum = fibWithMemoization(n: n - 1, memo: &memo) + fibWithMemoization(n: n - 2, memo: &memo)
        return sum
    }
}

var emptyDictionary: [Int: Int] = [:]

fibWithMemoization(n: 10, memo: &emptyDictionary)

