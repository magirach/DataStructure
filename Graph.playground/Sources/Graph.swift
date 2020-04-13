import Foundation

public class Graph<T: Hashable>: CustomStringConvertible {
    
    var nodes = [Node<T>]()
    
    public var description: String {
        return ""
    }
        
    public func createNode(value: T) -> Node<T> {
        let node = Node(value: value)
        return node
    }
    
    public func connect(node: Node<T>, to: Node<T>) {
        
    }
    
    public init() {
        
    }
    
    public func dfsSearch(node: Node<T>) {
        var stack = [Node<T>]()
        var visited = [T]()
        stack.append(node)
        visited.append(node.value)
        while !stack.isEmpty {
            let top = stack.first!
            var remove = true
            for relative in top.relaives {
                if !visited.contains(relative.value) {
                    stack.insert(relative, at: 0)
                    visited.append(relative.value)
                    remove = false
                    break
                }
            }
            if remove {
                stack.removeFirst()
            }
        }
        print(visited)
    }
    
    public func bfsSearch(node: Node<T>) {
        var queue = [Node<T>]()
        var visited = [T]()
        queue.append(node)
        while !queue.isEmpty {
            let node = queue.removeFirst()
            for n in node.relaives {
                if !visited.contains(n.value) {
                    queue.append(n)
                }
            }
            if !visited.contains(node.value) {
                visited.append(node.value)
            }
        }
        print(visited)
    }
}
