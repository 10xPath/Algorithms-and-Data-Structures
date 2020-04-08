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

