import Foundation

public class Node<T: Equatable> {
    
    public var value: T
    public var relaives: [Node]
    
    static func == (lhs: Node, rhs: Node) -> Bool {
        lhs.value == rhs.value
    }
    
    init(value: T) {
        self.value = value
        self.relaives = []
    }
}
