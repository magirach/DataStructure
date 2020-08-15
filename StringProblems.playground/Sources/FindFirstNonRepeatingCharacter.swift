import Foundation

/// Given a string, find its first non-repeating character
/// - Parameter string: input string
public func findFirstNonRepeatingCharacter(string: String) -> String {
    var arrNonRepeatingChar = [Character]()
    for char in string {
        if let index = arrNonRepeatingChar.firstIndex(of: char) {
            arrNonRepeatingChar.remove(at: index)
        } else {
            arrNonRepeatingChar.append(char)
        }
    }
    return String(arrNonRepeatingChar[0])
}
