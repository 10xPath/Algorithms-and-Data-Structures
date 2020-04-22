import UIKit

var str = "Hello, playground"


//MARK: 1.Write the fibonacci recursive function without memoization.
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


//MARK: 2. Add memoization to the fibonacci function

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

var array = Array(repeating: -1, count: 11)
func fibWithMemoizationArray(n: Int, memo: inout [Int]) -> Int {
    
    if n == 0 {
        return 0
    }
    
    if n == 1 {
        return 1
    }
    
    if memo[n] != -1 {
        return memo[n]
    } else {
        let sum = fibWithMemoizationArray(n: n - 1, memo: &memo) + fibWithMemoizationArray(n: n - 2, memo: &memo)
        return sum
    }
}

func fibBottomUp(n: Int) -> Int {
    var cache: [Int] = Array(repeating: 0, count: n + 1)
     if n == 0 {return 0}
    cache[1] = 1
    
    for i in 2...n - 1 {
        print("\(cache[i - 1]) + \(cache[i-2])")
        cache[i] = cache[i - 1] + cache[i - 2]
    }
   
    return cache[n]
}

fibBottomUp(n: 10)

func fibBottomUpOptimized(n: Int) -> Int {
    if n < 2 {return n}
    
    var n0 = 0
    var n1 = 1
    
    for i in 2..<n{
        let n2 = n0 + n1
        n0 = n1
        n1 = n2
    }
    
    return n0 + n1
}

fibBottomUpOptimized(n: 10)

fibWithMemoizationArray(n: 10, memo: &array)




//MARK: 3. Write a function that returns the length of the longest palindromic subsequence of a string of length n <= 10.

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

//Longest Palindromic Subsequence Recursion
private func longestPalindromicSubsequenceRecursion(s: String) -> Int {
    let startIndex = 0
    let endIndex = s.count - 1
    
    return longestPalindromicSubsequenceRecursionHelper(s: s, startIndex: startIndex, endIndex: endIndex)
}

//let s = "bbbab"
private func longestPalindromicSubsequenceRecursionHelper(s: String, startIndex: Int, endIndex: Int) -> Int {
    
    if startIndex > endIndex {
        return 0
    } else if startIndex == endIndex {
        return 1
    } else {
        if Array(s)[startIndex] == Array(s)[endIndex] {
            return longestPalindromicSubsequenceRecursionHelper(s: s, startIndex: startIndex + 1 , endIndex: endIndex - 1) + 2
        } else {
            let longestPalindromicStart = longestPalindromicSubsequenceRecursionHelper(s: s, startIndex: startIndex + 1 , endIndex: endIndex)
            let longestPalindromicEnd = longestPalindromicSubsequenceRecursionHelper(s: s, startIndex: startIndex , endIndex: endIndex - 1)
            return longestPalindromicStart > longestPalindromicEnd ? longestPalindromicStart : longestPalindromicEnd
        }
    }
}
//             | |
var example = "abdcba"

//                 ||   longestPalindromicStart => 1 = 1
//var example = "bbbab"

//                ||    longestPalindromicEnd => 1 + 2 = 3
//var example = "bbbab"
//

//Max(1,3) => 3
//count = f(n) + 2
//         /\
//
//
//bbbb

//startIndex = 0
//endIndex = 4



print(longestPalindromicSubsequenceRecursion(s: example))


//Top Down Approach

private func longestPalindromicSubsequenceRecursionTopDown(s: String) -> Int {
    let startIndex = 0
    let endIndex = s.count - 1
    var indexDictionary: [String: Int] = [:]
    
    return longestPalindromicSubsequenceRecursionHelperTopDown(s: s, startIndex: startIndex, endIndex: endIndex, lookupDictionary: &indexDictionary)
}

//let s = "bbbab"
private func longestPalindromicSubsequenceRecursionHelperTopDown(s: String, startIndex: Int, endIndex: Int, lookupDictionary: inout [String: Int]) -> Int {
    
    if startIndex > endIndex {
        return 0
    } else if startIndex == endIndex {
        return 1
    } else {
        
        if let sequenceCount = lookupDictionary["\(startIndex)-\(endIndex)"] {
            return sequenceCount
        } else {
            if Array(s)[startIndex] == Array(s)[endIndex] {
                let sequence = longestPalindromicSubsequenceRecursionHelperTopDown(s: s, startIndex: startIndex + 1 , endIndex: endIndex - 1, lookupDictionary: &lookupDictionary) + 2
                lookupDictionary["\(startIndex)-\(endIndex)"] = sequence
                return sequence
            } else {
                let longestPalindromicStart = longestPalindromicSubsequenceRecursionHelperTopDown(s: s, startIndex: startIndex + 1 , endIndex: endIndex, lookupDictionary: &lookupDictionary)
                let longestPalindromicEnd = longestPalindromicSubsequenceRecursionHelperTopDown(s: s, startIndex: startIndex , endIndex: endIndex - 1, lookupDictionary: &lookupDictionary)
                
                if longestPalindromicStart > longestPalindromicEnd {
                     lookupDictionary["\(startIndex)-\(endIndex)"] = longestPalindromicStart
                     return longestPalindromicStart
                } else {
                    lookupDictionary["\(startIndex)-\(endIndex)"] = longestPalindromicEnd
                    return longestPalindromicEnd
                }
               
            }
        }
    }
}

longestPalindromicSubsequenceRecursionTopDown(s: "abdcbaf")

//Bottom up approach


//MARK: 4. Write a function that returns the maximum length of non-decreasing subsequence of an array a of length n.

func getAllSubsets(n: [Int], subsets: inout [[Int]], subset: inout [Int], startIndex: Int) -> [[Int]] {
    subsets.append(subset)
    
    for i in startIndex..<n.count {
        subset.append(n[i])
        getAllSubsets(n: n, subsets: &subsets, subset: &subset, startIndex: i + 1)
        subset.removeLast()
    }
    
    return subsets
}

func maxLengthSubset(n: [Int]) -> Int {
    
    if n.count < 2 {
        return 2
    }
    var subsets: [[Int]] = []
    var subset:[Int] = []
    var generatedSubsets = getAllSubsets(n: n, subsets: &subsets, subset: &subset, startIndex: 0)

    var maxCount = Int.min
    for subset in generatedSubsets {
        var count = 1
        if subset.count == 0 {
            continue
        }
        for i in 0..<subset.count - 1{
            count += 1
            if subset[i] > subset[i + 1] || i + 1 == subset.count - 1{
                
                maxCount = maxCount > count ? maxCount : count
                
                print("maxCount recorded for \(count) \(subset)")
                count = 0
            }
        }
    }
    
    return maxCount
}



maxLengthSubset(n: [2, 5, 3, 5, 7])



