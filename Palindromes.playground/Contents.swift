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


