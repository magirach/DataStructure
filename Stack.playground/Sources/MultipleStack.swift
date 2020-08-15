import Foundation

public struct MultipleStack: CustomStringConvertible {
    public var  description: String {
        var str = [String]()
        for (index, stack) in arrStack.enumerated() {
            str.append("\(index) ::: \(stack)")
        }
        return str.joined(separator: "\n")
    }
    
    private var arrStack: [[Int]]
    
    public func peak(stack: Int) -> Int? {
        return arrStack[stack].first
    }
    
    public mutating func push(value: Int, at stack: Int) {
        arrStack[stack].insert(value, at: 0)
    }
    
    public mutating func pop(at stack: Int) -> Int? {
        if arrStack[stack].isEmpty {
            return nil
        } else {
            return arrStack[stack].removeFirst()
        }
    }
    
    public init(stacks: Int) {
        arrStack = [[Int]].init(repeating: [Int](), count: stacks)
    }
}
