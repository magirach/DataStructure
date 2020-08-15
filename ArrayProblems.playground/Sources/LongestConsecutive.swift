import Foundation

/// gives logest consticutime number sequence in given array
/// - Parameter arr: input array
/// - Returns: number of logest consicutive secquence element
public func longestConsecutive(_ arr: [Int]) -> Int {
  let sorted = arr.sorted()
  print(sorted)
  var max = 0
  var first = -1
  var count = 0
  for element in sorted {
    if first == -1 {
      first = element
      count += 1
    } else if element - first == 1 {
      count += 1
      first = element
        if count > max {
          max = count
        }
    } else {
      count = 1
      first = element
    }
  }
  return max

}
