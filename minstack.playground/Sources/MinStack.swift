import Foundation

public struct MinStack {
    private var arrStack = [Int]()
    private var minElement: Int?
    
    public var min: Int? {
        return minElement
    }
    
    public var peek: Int? {
        if let top = arrStack.first {
            return top < minElement! ? minElement! : top
        } else {
            return nil
        }
    }
    
    public mutating func push(value: Int) {
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
    
    public mutating func pop() -> Int? {
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
    
    public init() {
        
    }
}
