import Foundation

/// compress string for ex aaabbb give a3b3
/// - Parameter string: input string
/// - Returns: conpresed string
public func stringCompression(string: String) -> String {
    var strOutput = ""
    let arrStr = Array(string)
    var repeated = 1
    for i in 0..<arrStr.count {
        if i + 1 < arrStr.count {
            if arrStr[i] == arrStr[i+1] {
                repeated += 1
            } else {
                strOutput.append(arrStr[i])
                if repeated > 1 {
                    strOutput.append("\(repeated)")
                }
                repeated = 1
            }
        }
    }
    return strOutput
}
