import Foundation


/// Given an array where every element occurs three times, except one element which occurs only once. Find the element that occurs once.
/// - Parameter arr: input array
/// - Returns: single element.
public func findSingleFromArray(arr: [Int]) -> Int {
    var output: Int = arr[0]
    let sortedArr = arr.sorted()
    var count = 0
    while count < sortedArr.count {
        if sortedArr[count] == sortedArr[count + 1] && sortedArr[count + 1] == sortedArr[count + 2] {
            count += 3
        } else {
            output = sortedArr[count]
            break
        }
    }
    return output
}
