
import UIKit

//Input: words = ["wrt","wrf","er","ett","rftt"]
//Output: "wertf"
//
//Input: words = ["z","x"]
//Output: "zx"


func alienOrder(_ words: [String]) -> String {
      //Identifying relationships between characters for references
      var neighborGraph = [Character: Set<Character>]()
       
      //Identify
      var degree = [Character: Int]()
  
      //Initialization
      words.forEach { word in
          word.forEach { char in
              degree[char] = 0
              neighborGraph[char] = Set<Character>()
          }
      }

      // Build neighborGraph
      for i in 0..<words.count-1{
          let word1 = Array(words[i]), word2 = Array(words[i + 1])
          var differenceFound = false
          let minWordCeiling = min(word1.count, word2.count)
          for j in 0..<minWordCeiling{
              let char1 = word1[j], char2 = word2[j]
              
              guard char1 != char2 else {
                  continue
              }
              differenceFound = true
              //If there's no previous relationship between character 1 and character 2
              //Bump degree count of character 2 by 1
              // How does the number of edges help us determine the ordering of the characters?
              if !neighborGraph[char1]!.contains(char2){
                  neighborGraph[char1]!.insert(char2)
                  degree[char2] = degree[char2]! + 1
              }
             break
          }

          if !differenceFound && word1.count > word2.count {
              return ""
          }
      }
      
       
      // BFS
      var queue = [Character]()
       
       //Initialize items with count of 0.
      for (key, value) in degree {
          if value == 0 {
              queue.append(key)
          }
      }
      
      var res = ""
      while !queue.isEmpty {
          let cur = queue.removeFirst()
          res += String(cur)
          for neighbor in neighborGraph[cur]! {
              //Update the priority of what will be processed first for neighbors of cur.
              degree[neighbor] = degree[neighbor]! - 1
              if degree[neighbor] == 0{
                  queue.append(neighbor)
              }
          }
      }
       
      return res.count == neighborGraph.count ? res : ""
}

print(alienOrder(["wrt","wrf","er","ett","rftt"]))
