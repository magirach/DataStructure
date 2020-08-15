import Foundation

///Count All Palindrome Sub-Strings in a String
public func countPalindromSubstrings(string: String) -> Int {
    var arrString = Array(string)
    var dp = [[Int]].init(repeating: [Int].init(repeating: 0, count: string.count), count: string.count)
    var p = [[Bool]].init(repeating: [Bool].init(repeating: false, count: string.count), count: string.count)
    
    for i in 0..<string.count {
        p[i][i] = true
    }
    
    for i in 0..<(string.count - 1) {
        if arrString[i] == arrString[i + 1] {
            p[i][i + 1] = true
            dp[i][i + 1] = 1
        }
    }
    print("-----------")
    print(dp)
    for gap in 2..<string.count {
        for startPoint in 0..<(string.count - gap) {
            let endPoint = gap + startPoint
            print("\(startPoint) - \(endPoint) :: \(dp)")

            if arrString[startPoint] == arrString[endPoint] && p[startPoint + 1][endPoint - 1] {
                p[startPoint][endPoint] = true
            }
            
            if p[startPoint][endPoint] {
                dp[startPoint][endPoint] = dp[startPoint][endPoint - 1] + dp[startPoint + 1][endPoint] + 1 - dp[startPoint + 1][endPoint - 1]
            } else {
                dp[startPoint][endPoint] = dp[startPoint][endPoint - 1] + dp[startPoint + 1][endPoint] - dp[startPoint + 1][endPoint - 1]
            }
            print("\(startPoint) - \(endPoint) :: \(dp)")
            print("-----------")
        }
    }
    
    print("-----------")
    print(dp)
    return dp[0][arrString.count - 1]
}
