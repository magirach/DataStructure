import Foundation

/// set row and col 0 if  element is 0
/// - Parameter matrix: input matrix
/// - Returns: out put matrix with row and col 0
public func setZeroMatrix(matrix: [[Int]]) -> [[Int]] {
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
