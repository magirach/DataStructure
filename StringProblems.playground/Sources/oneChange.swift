import Foundation

/// check either string 1 and string 2 have only one change
/// - Parameters:
///   - s1: string 1
///   - s2: string 2
/// - Returns: true if only one change from string 1 and 2
public func oneChange(s1: String, s2: String) -> Bool {
    var output = true
    if abs(s1.count - s2.count) > 1 {
        output = false
    }
    
    let sortString = Array(s1.count < s2.count ? s1 : s2)
    let longString = Array(s1.count > s2.count ? s1 : s2)
    
    var firstIndex = 0
    var secondIndex = 0
    var hasDifference = false
    
    while firstIndex < sortString.count && secondIndex < longString.count {
        if sortString[firstIndex] != longString[secondIndex] {
            if hasDifference {
                output = false
                break
            } else {
                hasDifference = true
            }
            if sortString.count == longString.count {
                firstIndex += 1
            }
        } else {
            firstIndex += 1
        }
        secondIndex += 1
    }
    return output
}
