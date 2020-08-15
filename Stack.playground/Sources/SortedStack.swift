import Foundation

public struct SortedStack: CustomStringConvertible {
    public var  description: String {
        return "\(arrStack)"
    }
    
    private var arrStack = [Int]()
    
    public var peek: Int? {
        return arrStack.first
    }
    
    public mutating func push(value: Int) {
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
    
    public mutating func pop() -> Int? {
        if arrStack.isEmpty {
            return nil
        } else {
            return arrStack.removeFirst()
        }
    }
    
    public init() {
        
    }
}
