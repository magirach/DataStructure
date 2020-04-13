import UIKit

var str = "Hello, playground"

extension Character: Codable {
    public init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        let string = try container.decode(String.self)
        guard string.count == 1 else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Multiple characters found when decoding a Character")
        }
        guard let character = string.first else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Empty String found when decoding a Character")
        }
        self = character
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()
        try container.encode(String(self))
    }
}

class Node: Codable {
    var value: String?
    var nodes: [String: Node] = [:]
    var isEnd: Bool = false
    
    init(value: String?) {
        self.value = value
    }
}

class Trie: Codable {
    private let root = Node(value: nil)
    
    func insert(word: String) {
        var current = root
        for char in word {
            if current.nodes[String(char)] == nil {
                current.nodes[String(char)] = Node(value: String(char))
            }
            current = current.nodes[String(char)]!
        }
        current.isEnd = true
    }
    
    func elements(prefix: String) -> [String] {
        var current = root
        for char in prefix {
            if current.nodes[String(char)] != nil {
                current = current.nodes[String(char)]!
            } else {
                return []
            }
        }
        
        return words(prefix: prefix, after: current)
    }
    
    func words(prefix: String, after: Node) -> [String] {
        var match = [String]()
        if after.isEnd {
            match.append(prefix)
        }
        for (char, node) in after.nodes {
            var prefix = prefix
            prefix.append(char)
            match.append(contentsOf: words(prefix: prefix, after: node))
        }
        return match
    }
}

let trie = Trie()
trie.insert(word: "Moinuddin")
trie.insert(word: "Moin")
trie.insert(word: "Apple")
print(trie.elements(prefix: "Mo"))


func csv(data: String) -> [String] {
    var result: [[String]] = []
    let rows = data.components(separatedBy: " \r\n")
//    for row in rows {
//        let columns = row.components(separatedBy: ";")
//        result.append(columns)
//    }
    return rows
}

//let path = Bundle.main.path(forResource: "a", ofType: "csv")
//print(path)
//let data = try? Data(contentsOf: URL(fileURLWithPath: path!))
//let words = csv(data: String(data: data!, encoding: .utf8)!)
//for word in words {
//    trie.insert(word: word)
//}
//let encoder = JSONEncoder()
//do {
//    let data = try encoder.encode(trie)
//    let path = Bundle.main.resourcePath
//    let filePath = path! + "/a.txt"
//    let pathUrl = URL(fileURLWithPath: filePath)
//    try? data.write(to: pathUrl)
//    print("write done")
//} catch {
//    print(error)
//}

let decoder = JSONDecoder()
do {
    let path = Bundle.main.resourcePath
    let filePath = path! + "/a.txt"
    let pathUrl = URL(fileURLWithPath: filePath)
    let data = try Data(contentsOf: pathUrl)
    let trie = try decoder.decode(Trie.self, from: data)
    print("trie generated")
    print(trie.elements(prefix: "a"))
} catch {
    print(error)
}


