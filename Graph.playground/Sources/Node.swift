import Foundation

public class Node<T: Equatable>: Equatable {
    
    public var value: T
    public var relaives: [Connection<T>]
    
    public static func == (lhs: Node, rhs: Node) -> Bool {
        lhs.value == rhs.value
    }
    
    init(value: T) {
        self.value = value
        self.relaives = []
    }
}

public class Connection<T: Equatable>: Equatable {
    public var to: Node<T>
    public var weight: Int
    
    public static func == (lhs: Connection, rhs: Connection) -> Bool {
        lhs.to == rhs.to && lhs.weight == rhs.weight
    }
    
    init(node: Node<T>, weight: Int) {
        to = node
        self.weight = weight
    }
}
