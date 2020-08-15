import Foundation

/// check eithr string have substrign where atleast 3 ? in between 2 integer which total is less than 10
/// - Parameter str: input string
/// - Returns: return true if condition stisfy else false
public func QuestionsMarks(_ str: String) -> String {
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
