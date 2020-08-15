import Foundation

/// check either string have unique characters
/// - Parameter str: input string
/// - Returns: true if string have unique characters
public func checkStringHasUniqueCharacters(str: String) -> Bool {
    let sorted = str.sorted()
    var isUnique = true
    for i in 0..<(sorted.count - 1) {
        if sorted[i] == sorted[i + 1] {
            isUnique = false
            break
        }
    }
    return isUnique
}
