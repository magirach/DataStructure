import Foundation

/// rotate matrix
/// - Parameters:
///   - matrix: input matrix
///   - left: true if left rotation else false
/// - Returns: return rotated matrix
public func roateMatrix(matrix:[[Int]], left: Bool) -> [[Int]] {
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
