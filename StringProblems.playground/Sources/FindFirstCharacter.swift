import Foundation

/// Find the character in first string that is present at minimum index in second string
public func findFirstCharacter(string: String, patern: String) -> Int {
    let arrString = Array(string)
    let arrPatern = Array(patern)
    var minIndex = arrString.count
    for elment in arrPatern {
        if let index = arrString.firstIndex(of: elment), index < minIndex {
            minIndex = index
        }
    }
    return minIndex
}
