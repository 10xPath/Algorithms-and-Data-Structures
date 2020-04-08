import UIKit

var str = "Hello, playground"


func printAllSubsequence(stringWord: String) {
    var subSequences:[String] = []
    var subString: String = ""
    var startIndex: Int = 0
    
    if stringWord.count > 10 {
        print("")
    } else {
        subSequences = getSubsequences(stringWord: stringWord, withSubsequences: &subSequences, subString: &subString, startIndex: startIndex)
        print(subSequences)
    }
}

//Run time is 2^nn
//Space time 2^n
func getSubsequences(stringWord: String, withSubsequences: inout [String], subString: inout String, startIndex: Int) -> [String] {
    withSubsequences.append(subString)
    for i in startIndex..<stringWord.count {
        subString.append(Array(stringWord)[i])
        getSubsequences(stringWord: stringWord, withSubsequences: &withSubsequences, subString: &subString, startIndex: i+1)
        subString.removeLast()
    }
    return withSubsequences
}

printAllSubsequence(stringWord: "abc")
