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
    var value: Character?
    var nodes: [Character: Node] = [:]
    var isEnd: Bool = false
    
    init(value: Character?) {
        self.value = value
    }
}

class Trie: Codable {
    private let root = Node(value: nil)
    
    func insert(word: String) {
        var current = root
        for char in word {
            if current.nodes[char] == nil {
                current.nodes[char] = Node(value: char)
            }
            current = current.nodes[char]!
        }
        current.isEnd = true
    }
    
    func elements(prefix: String) -> (words: [String], time: Int) {
        let start = Date().timeIntervalSince1970 * 1000
        var current = root
        for char in prefix {
            if current.nodes[char] != nil {
                current = current.nodes[char]!
            } else {
                return ([], 0)
            }
        }
        
        let wrds = words(prefix: prefix, after: current)
        let end = Date().timeIntervalSince1970 * 1000
        return (wrds, Int(end - start))
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

var trie = Trie()
trie.insert(word: "Moinuddin")
trie.insert(word: "Moin")
trie.insert(word: "Apple")
print(trie.elements(prefix: "Mo"))


func csv(data: String) -> [String] {
    let rows = data.components(separatedBy: " \r\n")
    return rows
}

func createTrie(fileName: String) -> Trie? {
    do {
        let filePath = Bundle.main.path(forResource: fileName, ofType: "csv")
        let pathUrl = URL(fileURLWithPath: filePath!)
        let data = try String(contentsOf: pathUrl)
        let arr = Set(csv(data: data))
        let trie = Trie()
        for e in arr {
            trie.insert(word: e)
        }
        print("trie generated")
        return trie
    } catch {
        print(error)
        return nil
    }
}

trie = createTrie(fileName: "o")!

print(trie.elements(prefix: "open"))


