import UIKit

//["eat","tea","tan","ate","nat","bat"]

/*
{"result":[
{"word":"eat"},
{"word":"tea"},
{"word":"tan"},
{"word":"ate},
{"word":"nat}
{"word":"bat}
]}
 */

/*
 //Cinema and iceman is an anagram
 ____________
|My Anagrams|
| +++++++++ |
|    bat    |
| +++++++++ |
|    nat    |
|    tan    |
| +++++++++ |
|    ate    |
|    eat    |
|    tea    |
| +++++++++ |
|___________|
 
 */

var sampleAPIURL = "sampleAPI.com/wordData.json"
class AnagramManager: AnagramProtocol {
    var service: WordServiceProtocol?
    
    static let shared = AnagramManager()
    
    func getAnagramGroups(completed: @escaping ([[String]]) -> Void) {
        service?.getWords(completed: { (words) in
            let anagramGroups = self.convertToAnagramGroups(words: words)
            completed(anagramGroups)
        })
    }
    
    private func convertToAnagramGroups(words: [String]) -> [[String]] {
        var groupDictionary:[String:[String]] = [:]
        for word in words {
            let sortedWord = word.sorted()
            let sortedString: String = String(sortedWord)
            if let groupArray = groupDictionary[String(sortedString)] {
                var mutatedGroupArray = groupArray
                mutatedGroupArray.append(word)
                groupDictionary[sortedString] = mutatedGroupArray
            } else {
                groupDictionary[sortedString] = [word]
            }
        }
        
        var results: [[String]] = []
        
        for (_, value) in groupDictionary {
            results.append(value)
        }
        
        return results
    }
}

protocol AnagramProtocol {
    func getAnagramGroups(completed: @escaping ([[String]]) -> Void)
}

struct WordModel {
    var word: String
    var date: Int
}


class WordService: WordServiceProtocol {
    var session: URLSession = URLSession.shared
    func getWords(completed: @escaping ([String]) -> Void) {
        var words: [WordModel] = []
        let sampleURLString = "sampleAPI.com/wordData.json"
        let urlString = URL(string: sampleURLString)
        guard let url = urlString else {
            return
        }
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            if let json = try? JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any]{
                let wordDataArray = json["result"] as? [[String:Any]] ?? []
                for wordData in wordDataArray {
                    if let word = wordData["word"] as? String, let date = wordData["date"] as? Int {
                        let wordModel = WordModel(word: word, date: date)
                        words.append(wordModel)
                    }
                }
            }
            
        })
        
        task.resume()
    }
}

protocol WordServiceProtocol {
    func getWords(completed: @escaping ([String]) -> Void)
}


class MyAnagramGroupViewController: UITableViewController {
    private var anagramGroups: [[String]] = []
    private var anagramManager: AnagramProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        anagramManager = AnagramManager.shared
    }
    
    private func retrieveAnagrams() {
        anagramManager?.getAnagramGroups(completed: { (retrievedAnagramGroups) in
            self.anagramGroups = retrievedAnagramGroups
            self.tableView.reloadData()
        })
    }
}
