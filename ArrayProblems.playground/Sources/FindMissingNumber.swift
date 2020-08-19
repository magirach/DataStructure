import Foundation

/// find missing number from array
/// - Parameter arr: input array
/// - Returns: missing number
public func findMissingNumber(arr: [Int]) -> Int {
    let arrTottal = arr.reduce(0) { $0 + $1}
    let totalUptoN = (arr.count + 1) * (arr.count + 2) / 2
    return totalUptoN - arrTottal
}
