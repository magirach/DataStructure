/// gives logest consticutime number sequence in given array
/// - Parameter arr: input array
/// - Returns: number of logest consicutive secquence element
func LongestConsecutive(_ arr: [Int]) -> Int {
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

print(LongestConsecutive([6, 7, 3, 1, 100, 102, 6, 12]))
print(LongestConsecutive([5, 6, 1, 2, 8, 9, 7]))

/// set row and col 0 if  element is 0
/// - Parameter matrix: input matrix
/// - Returns: out put matrix with row and col 0
func setZeroMatrix(matrix: [[Int]]) -> [[Int]] {
    var output = matrix
    var arrRowsZero = [Bool].init(repeating: false, count: output.count)
    var arrColZero = [Bool].init(repeating: false, count: output[0].count)
    
    for (rowIndex, row) in matrix.enumerated() {
        for (colIndex, val) in row.enumerated() {
            if val == 0 {
                arrRowsZero[rowIndex] = true
                arrColZero[colIndex] = true
            }
        }
    }
    
    for (index,element) in arrRowsZero.enumerated() {
        if element {
            output[index] = [Int].init(repeating: 0, count: output[0].count)
        }
    }
    for (index,element) in arrColZero.enumerated() {
        if element {
            for i in 0..<output.count {
                output[i][index] = 0
            }
        }
    }
    
    return output
}

print(setZeroMatrix(matrix: [[1,0,3],[4,5,6],[7,8,0],[10,11,12]]))

/// rotate matrix
/// - Parameters:
///   - matrix: input matrix
///   - left: true if left rotation else false
/// - Returns: return rotated matrix
func roateMatrix(matrix:[[Int]], left: Bool) -> [[Int]] {
    var output = [[Int]].init(repeating: [Int].init(repeating: 0, count: matrix.count), count: matrix[0].count)
    for (rowIndex, row) in matrix.enumerated() {
        for (colIndex, val) in row.enumerated() {
            if left {
                output[colIndex][rowIndex] = val
            } else {
                output[colIndex][matrix.count - 1 - rowIndex] = val
            }
        }
    }
    return output
}

print(roateMatrix(matrix: [[1,2,3],[4,5,6],[7,8,9],[10,11,12]], left: true))
print(roateMatrix(matrix: [[1,2,3],[4,5,6],[7,8,9],[10,11,12]], left: false))
