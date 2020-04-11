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


//func isPalindromSubsequenceRecursion(word: String) -> Bool {
//
//    if word.count < 3 {
//        return false
//    }
//    var matchCount = 0 //If matchCount is 3 then return true
//    let stringWithoutSpace = getStringWithNoSpaceAndLowerCase(word: word)
//    if stringWithoutSpace.count == 0 {
//        return false
//    } else {
//        return isPalindromSubsequenceRecursionHelper(lastIndex: stringWithoutSpace.count - 1, word: stringWithoutSpace)
//    }
//
//
//}
//
//func isPalindromSubsequenceRecursionHelper(lastIndex: Int, word: String) -> Bool {
//
//
//    for i in 0..<word.count {
//        if lastIndex == i {
//            return
//        }
//        if Array(word)[i] == Array(word)[lastIndex] {
//            matchCount = matchCount + 1
//            return isPalindromSubsequenceRecursionHelper(lastIndex: lastIndex - 1, word: word)
//        } else {
//            matchCount = 0
//
//            if i == lastIndex {
//                return isPalindromSubsequenceRecursionHelper(lastIndex: word.count - 1, word: word)
//            } else {
//                return isPalindromSubsequenceRecursionHelper(lastIndex:lastIndex - 1, word: word)
//            }
//
//        }
//    }
//
//
//}
//
//isPalindromSubsequenceRecursion(word: "hi a slant at a nasal lhn")

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


