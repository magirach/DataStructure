import UIKit
import Foundation

var str = "Hello, playground"


/// check either string have unique characters
/// - Parameter str: input string
/// - Returns: true if string have unique characters
func checkStringHasUniqueCharacters(str: String) -> Bool {
    let sorted = str.sorted()
    var isUnique = true
    for i in 0..<(sorted.count - 1) {
        if sorted[i] == sorted[i + 1] {
            isUnique = false
            break
        }
    }
    return isUnique
}

checkStringHasUniqueCharacters(str: "1234567890")


/// check s1 and s2 anre permutation of each other
/// - Parameters:
///   - str1: string 1
///   - str2: string 2
/// - Returns: true if both are permutation of each other
func checkStringPermutation(str1: String, str2: String) -> Bool {
    if str1.count == str2.count {
        if str1 == str2 {
            return true
        } else {
            return str1.sorted() == str2.sorted()
        }
    }else {
        return false
    }
}

checkStringPermutation(str1: "1234567890", str2: "1283495607")

/// check string is palindrom
/// - Parameter string: steing to be checked
/// - Returns: true if string is palindrom
func checkPalindromeString(string: String) -> Bool {
    let stringLength = string.count
    let arrStr = Array(string)
    for i in 0...(stringLength / 2) {
        print(i)
        if arrStr[i] != arrStr[stringLength - i - 1] {
            return false
        }
    }
    return true
}

checkPalindromeString(string: "palindromordnilap")
checkPalindromeString(string: "palindromornilap")


/// compress string for ex aaabbb give a3b3
/// - Parameter string: input string
/// - Returns: conpresed string
func stringCompression(string: String) -> String {
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

stringCompression(string: "aafffeeerrjkllkjkljlkj33344ljjljkkljlkj")

/// ckeck string 2 is made of from rotation of character of string 1
/// - Parameters:
///   - s1: string 1
///   - s2: strign 2
/// - Returns: true if condition staisfy
func checkStringRotation(s1: String, s2: String) -> Bool {
    return (s1+s1).contains(s2) && s1.count == s2.count
}

print(checkStringRotation(s1: "moinuddin", s2: "uddinmoin"))
print(checkStringRotation(s1: "moinuddin", s2: "ddinmoin"))

/// check either string 1 and string 2 have only one change
/// - Parameters:
///   - s1: string 1
///   - s2: string 2
/// - Returns: true if only one change from string 1 and 2
func oneChange(s1: String, s2: String) -> Bool {
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

print(oneChange(s1: "pale", s2: "ple"))
print(oneChange(s1: "pales", s2: "pale"))
print(oneChange(s1: "pale", s2: "bale"))
print(oneChange(s1: "pale", s2: "bae"))


/// check eithr string have substrign where atleast 3 ? in between 2 integer which total is less than 10
/// - Parameter str: input string
/// - Returns: return true if condition stisfy else false
func QuestionsMarks(_ str: String) -> String {
  var start = -1
  var end = -1
  var queCount = 0
  for comps in str {
    if let isInt = Int(String(comps)) {
        if start < 0 {
            start = isInt
        } else if isInt + start < 10 {
            if queCount >= 3 {
                return "true"
            }
        }
    } else if String(comps) == "?" && start != -1 {
        queCount += 1
    }
  }
  // code goes here
  // Note: feel free to modify the return type of this function
  return "false"

}

QuestionsMarks("acc?7??sss?3rr1??????5")

