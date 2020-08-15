import Foundation

public struct StackOfPlates {
    private var arrStack = [[Int]]()
    var max: Int
    
    public init(max: Int) {
        self.max = max
        arrStack.append([])
    }
    
    public var peek: Int? {
        return arrStack.last?.last
    }
    
    public mutating func push(value: Int) {
        if arrStack.first!.count == max {
            arrStack.insert([value], at: 0)
        } else {
            arrStack[0].insert(value, at: 0)
        }
        print(arrStack)
    }
    
    public mutating func pop() -> Int? {
        if arrStack.isEmpty {
           return nil
        } else {
            if arrStack.first!.count == 1 {
                let value = arrStack[0].removeLast()
                arrStack.removeFirst()
                return value
            } else {
                return arrStack[0].removeFirst()
            }
        }
    }
}
