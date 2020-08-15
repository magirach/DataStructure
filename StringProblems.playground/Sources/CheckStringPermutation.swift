import Foundation

/// check s1 and s2 anre permutation of each other
/// - Parameters:
///   - str1: string 1
///   - str2: string 2
/// - Returns: true if both are permutation of each other
public func checkStringPermutation(str1: String, str2: String) -> Bool {
    if str1.count == str2.count {
        if str1 == str2 {
            return true
        } else {
            return str1.sorted() == str2.sorted()
        }
    }else {
        return false
    }
}
