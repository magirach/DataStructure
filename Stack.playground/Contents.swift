import UIKit

var str = "Hello, playground"

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

var stackPlate = StackOfPlates(max: 5)
stackPlate.push(value: 1)
stackPlate.push(value: 2)
stackPlate.push(value: 3)
stackPlate.push(value: 4)
stackPlate.push(value: 5)
stackPlate.push(value: 6)
stackPlate.push(value: 7)
stackPlate.push(value: 8)
stackPlate.push(value: 9)
stackPlate.push(value: 10)
stackPlate.pop()
stackPlate.pop()
stackPlate.pop()
stackPlate.pop()
stackPlate.pop()
print(stackPlate)
