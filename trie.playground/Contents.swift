import UIKit

var str = "Hello, playground"

public struct MinStack {
    private var arrStack = [Int]()
    private var minElement: Int?
    
    var min: Int? {
        return minElement
    }
    
    var peek: Int? {
        if let top = arrStack.first {
            return top < minElement! ? minElement! : top
        } else {
            return nil
        }
    }
    
    mutating func push(value: Int) {
        if arrStack.isEmpty {
            arrStack.insert(value, at: 0)
            minElement = value
        } else {
            if value < minElement! {
                arrStack.insert(2 * value - minElement!, at: 0)
                minElement = value
            } else {
                arrStack.insert(value, at: 0)
            }
        }
    }
    
    mutating func pop() -> Int? {
        if arrStack.isEmpty {
           return nil
        } else {
            let top = arrStack.removeFirst()
            if top < minElement! {
                let min = minElement!
                minElement = 2 * minElement! - top
                return min
            } else {
                return top
            }
        }
    }
}

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
 */

public struct SortedStack: CustomStringConvertible {
    public var  description: String {
        return "\(arrStack)"
    }
    
    private var arrStack = [Int]()
    
    var peek: Int? {
        return arrStack.first
    }
    
    mutating func push(value: Int) {
        if arrStack.isEmpty {
            arrStack.insert(value, at: 0)
        } else {
            if value > peek! {
                let val = pop()
                push(value: value)
                arrStack.insert(val!, at: 0)
            } else {
                arrStack.insert(value, at: 0)
            }
        }
    }
    
    mutating func pop() -> Int? {
        if arrStack.isEmpty {
            return nil
        } else {
            return arrStack.removeFirst()
        }
    }
}
/*
var stack = SortedStack()
stack.push(value: -3)
stack.push(value: 3)
stack.push(value: 5)
stack.push(value: 2)
stack.push(value: 100)
stack.push(value: 1)

print(stack)
*/
