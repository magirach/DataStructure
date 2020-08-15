import Foundation

/// ckeck string 2 is made of from rotation of character of string 1
/// - Parameters:
///   - s1: string 1
///   - s2: strign 2
/// - Returns: true if condition staisfy
public func checkStringRotation(s1: String, s2: String) -> Bool {
    return (s1+s1).contains(s2) && s1.count == s2.count
}
