import Foundation

/// Given an array that represents elements of arithmetic progression in order. One element is missing in the progression, find the missing number.
/// - Parameter arr: input array
/// - Returns: missing number
public func findMissingNumberForArithmaticProgression(arr: [Int]) -> Int {
    let diff = (arr.last! - arr.first!) / arr.count
    return findMissingNumberForArithmaticProgression(arr: arr, start: 0, end: arr.count, diff: diff)
}

private func findMissingNumberForArithmaticProgression(arr: [Int], start: Int, end: Int, diff: Int) -> Int {
    let mid = start + (end - start) / 2
    if arr[mid + 1] - arr[mid] != diff {
        return arr[mid] + diff
    } else if arr[mid] - arr[mid - 1] != diff {
        return arr[mid] - diff
    } else if arr[mid] == arr[0] + mid * diff {
        return findMissingNumberForArithmaticProgression(arr: arr, start: mid + 1, end: end, diff: diff)
    } else {
        return findMissingNumberForArithmaticProgression(arr: arr, start: start, end: mid - 1, diff: diff)
    }
}
