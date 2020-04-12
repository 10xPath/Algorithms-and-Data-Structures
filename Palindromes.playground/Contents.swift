import UIKit

var str = "Hello, playground"


//7. Write a function that determines if a String is a palindrome INPUT: “ISSA” OUTPUT: True , INPUT: “SSA” OUTPUT: False
// Run time of O(n) and Space time of O(1) or O(n)
func isValidPalindrome(forWord word: String) -> Bool {
    let stringWithoutSpace = getStringWithNoSpaceAndLowerCase(word: word)
    if stringWithoutSpace.count == 0 {
        return false
    } else {
        var lastIndexCounter = stringWithoutSpace.count - 1
        for i in 0..<stringWithoutSpace.count {
            if Array(stringWithoutSpace)[i] == Array(stringWithoutSpace)[lastIndexCounter] {
                lastIndexCounter = lastIndexCounter - 1
            } else {
                return false
            }
        }
    }
    return true
}

func getStringWithNoSpaceAndLowerCase(word: String) -> String {
    var stringWithNoSpace = ""
    print(word)
    for char in word {
        if char != " " {
            stringWithNoSpace.append(char.lowercased())
        }
    }
    
    return stringWithNoSpace
}

func isPalindromSubequence(word: String) -> Bool {
    var matchCount = 0 //If matchCount is 3 then return true
    let stringWithoutSpace = getStringWithNoSpaceAndLowerCase(word: word)
    if stringWithoutSpace.count == 0 {
        return false
    } else {
        
        for firstIndex in 0..<stringWithoutSpace.count {
            for lastIndex in (0..<stringWithoutSpace.count).reversed() {
                if Array(stringWithoutSpace)[firstIndex] == Array(stringWithoutSpace)[lastIndex] {
                    matchCount = matchCount + 1
                    if matchCount == 3 {
                        return true
                    }
                } else {
                    matchCount = 0
                }
            }
        }
    }
    
    return false
}

isPalindromSubequence(word: "hhASLAT")



func getSubsequences(s: String) -> [String] {
    
    var results: [String] = []
    var subSequence: String = ""
    let index = 0
    
    if s.count == 0 {
        return results
    }
    
    getSubsequencesHelper(s: s, results: &results, subSequence: &subSequence, startIndex: index)
    
    return results
}



func getSubsequencesHelper(s: String, results: inout [String], subSequence: inout String, startIndex: Int) {
    print("Adding \(subSequence) to results that has \(results) at recusion number \(startIndex)")
    results.append(subSequence)
    
    for i in startIndex..<s.count {
        print("Adding \(Array(s)[i]) to subarray that has \(subSequence) at loop \(i)")
        subSequence.append(Array(s)[i])
        getSubsequencesHelper(s: s, results: &results, subSequence: &subSequence, startIndex: i + 1)
        subSequence.removeLast()
    }
}


func isPalindrom(s: String) -> Bool {
    
    if s.count < 2 {
        return false
    }
        
    
    var i = 0
    var j = s.count - 1
    
    while j >= 0 && i < s.count {
        if Array(s)[i] != Array(s)[j] {
            return false
        }
        
        i = i + 1
        j = j - 1
    }
    
    return true
    
}

//9.Write a recursive function that finds if a string has a palindrome subsequence of length > 1 and returns true if it’s the case
//Helper Functions I used:
//getStringWithNoSpaceAndLowerCase
//getSubsequences
//isPalindrom

func hasAtLeastOnePalindromeSubsequence(s: String) -> Bool {
    let stringWithoutSpace = getStringWithNoSpaceAndLowerCase(word: s)
    if stringWithoutSpace.count == 0 {
        return false
    } else {
       let subSequencesOfString = getSubsequences(s: stringWithoutSpace)
        for subSequence in subSequencesOfString {
            if isPalindrom(s: subSequence) {
                return true
            }
        }
    }
    
    return false
}

hasAtLeastOnePalindromeSubsequence(s: "a")


getSubsequences(s: "applea")


func isSubsequence(_ s: String, _ t: String) -> Bool {
    var arrayChar: [Character] = []
    
    for char in s {
        arrayChar.append(char)
    }
    
    for char in t {
        
        
        if let firstChar = arrayChar.first {
            print("Comparing \(firstChar) to \(char)")
            if firstChar == char {
                arrayChar.removeFirst()
                if arrayChar.isEmpty {
                    return true
                }
            }
        }
        
    }
    
    return false
    
}

isSubsequence("abc", "ahbgdc")


//Bonus Questions
func longestPalindromicSubstring(s: String) -> String {
    var startLength = 0
    var endLength = 0
    var maxLength = 0
    for index in 0..<s.count {
        var lengthIndex = index
        let singleLength = checkPalindromLength(s: s, leftIndex: lengthIndex, rightIndex:lengthIndex)
        let duplicateLength = checkPalindromLength(s: s, leftIndex: lengthIndex, rightIndex: lengthIndex + 1)
        let innerMaxLength = singleLength > duplicateLength ? singleLength :  duplicateLength
        if innerMaxLength > (endLength - startLength) {
            startLength = index - innerMaxLength/2
            endLength = index + innerMaxLength/2
            maxLength = innerMaxLength
        }
    }
    //    let range = Range(
    //    range.star
    //    return s.substring(with: Range()
    let startIndex = s.index(s.startIndex, offsetBy: startLength)
    let endIndex = s.index(s.startIndex, offsetBy: endLength - 1)
    let range = startIndex...endIndex
    let array: [String] = []
    
    return String(s[range])
}

func checkPalindromLength(s: String, leftIndex: Int, rightIndex: Int) -> Int {
    var leftIndex = leftIndex
    var rightIndex = rightIndex
    while (leftIndex >= 0 && rightIndex < s.count && Array(s)[leftIndex] == Array(s)[rightIndex]) {
        leftIndex = leftIndex - 1
        rightIndex = rightIndex + 1
    }
    
    return rightIndex - leftIndex
}
