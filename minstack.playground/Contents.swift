import UIKit

var str = "Hello, playground"

struct A {
    init() {
        
    }
}

protocol c {
    var moin: String
}

extension A: c {
    
    var moin: String
    
    static func abcd() {
        print("abcd")
    }
    
    var d: String {
        return "1234"
    }
    
    init(b: String) {
        print(d)
    }
    
    deinit {
        moin = ""
    }
}

let a = A(b: "cc")
A.abcd()
/*
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
*/

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
  // code goes here
  // Note: feel free to modify the return type of this function
  return max

}

print(LongestConsecutive([6, 7, 3, 1, 100, 102, 6, 12]))
print(LongestConsecutive([5, 6, 1, 2, 8, 9, 7]))

/*
 var stack = MinStack()
 stack.push(value: 3)
 stack.push(value: 5)
 print(stack.min)
 stack.push(value: 2)
 stack.push(value: 1)
 print(stack.min)
 stack.pop()
 print(stack.min)
 stack.pop()
 print(stack.peek)
 


var sstack = SortedStack()
sstack.push(value: -3)
sstack.push(value: 3)
sstack.push(value: 5)
sstack.push(value: 2)
sstack.push(value: 100)
sstack.push(value: 1)

print(sstack)

var multiS = MultipleStack(stacks: 5)
multiS.push(value: 4, at: 0)
multiS.push(value: 41, at: 2)
multiS.push(value: 42, at: 1)
multiS.push(value: 43, at: 0)
print(multiS)
multiS.pop(at: 2)
print(multiS)
*/
