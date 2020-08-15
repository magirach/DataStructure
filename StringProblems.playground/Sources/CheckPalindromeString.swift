import Foundation

/// check string is palindrom
/// - Parameter string: steing to be checked
/// - Returns: true if string is palindrom
public func checkPalindromeString(string: String) -> Bool {
    let stringLength = string.count
    let arrStr = Array(string)
    for i in 0...(stringLength / 2) {
        if arrStr[i] != arrStr[stringLength - i - 1] {
            return false
        }
    }
    return true
}
