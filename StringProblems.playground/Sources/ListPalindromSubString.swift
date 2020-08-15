import Foundation

/// list palindrome substring
/// - Parameter string: input string
public func listPalindromSubString(string: String) {
    var possibleSubstrings: [String] = []
    let arrString = Array(string)
    for start in 0..<string.count {
        for end in (start + 1)..<string.count {
            possibleSubstrings.append(String(arrString[start...end]))
        }
    }
    for elemet in possibleSubstrings {
        if checkPalindromeString(string: elemet) {
            print(elemet)
        }
    }
}
