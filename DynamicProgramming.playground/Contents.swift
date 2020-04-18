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

//Corner Cases:
// Can we assert that there is no space
// s = "bbbab" -> ["b"], ["bb"], ["bbb"], ["bbbb"] , ["bab"] -> ["bbbb"] -> 4
// s = "cbbd" -> ["c"], ["cb"], ["cbb"], ["cd"]

// 1. Get all possible subsequences
// 2. Get the subsequences with Palindromes
// 3. Loop through and find the max Length

let s = "bbbab"
//bbbab
//[bb],[bb], [ba],[ba], [bbbb]

//T- 2^n S- O(n)
func longestPalindromicSubsequence(s: String) -> Int {
    var subSequence = ""
    var subSequences:[String] = []
    var palindromicSubsequences: [String] = []
    var maxSubsequenceLength = Int.min
    
    getAllPossibleSubSequences(s: s, subsequence: &subSequence, subsequences: &subSequences, startIndex: 0)
    
    for subSequenceElement in subSequences {
        if isPalindrome(s: subSequenceElement) {
            palindromicSubsequences.append(subSequenceElement)
        }
    }
    
    for palindromicSubsequence in palindromicSubsequences {
        maxSubsequenceLength = maxSubsequenceLength > palindromicSubsequence.count ? maxSubsequenceLength : palindromicSubsequence.count
    }
    
    return maxSubsequenceLength
}

func getAllPossibleSubSequences(s: String, subsequence: inout String, subsequences: inout [String], startIndex: Int) -> [String] {
    subsequences.append(subsequence)
    for i in startIndex..<s.count {
        subsequence.append(Array(s)[i])
        getAllPossibleSubSequences(s: s, subsequence: &subsequence, subsequences: &subsequences, startIndex: i + 1)
        subsequence.removeLast()
    }
    
    return subsequences
}

func isPalindrome(s: String) -> Bool {
    var startIndex = 0
    var endIndex = s.count - 1
    while startIndex < endIndex {
    
        if Array(s)[startIndex] != Array(s)[endIndex] {
            return false
        }
        
        startIndex += 1
        endIndex -= 1
    }
    return true
}

longestPalindromicSubsequence(s: s)



