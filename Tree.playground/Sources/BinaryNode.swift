import Foundation

public class BinaryNode {
    
    public var value: Int
    public var horizontalDistance: Int = 0
    public var left: BinaryNode?
    public var right: BinaryNode?
    
    public init(_ value: Int) {
        self.value = value
    }
}

extension BinaryNode {
    
    public var hight: Int {
        return hight(node: self)
    }
    
    private func hight(node: BinaryNode?) -> Int {
        if node == nil {
            return 0
        }
        
        let leftHight = hight(node: node?.left)
        let rightHight = hight(node: node?.right)
        
        if leftHight > rightHight {
            return leftHight + 1
        } else {
            return rightHight + 1
        }
    }
}
