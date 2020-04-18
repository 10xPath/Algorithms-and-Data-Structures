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

