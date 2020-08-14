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
    
    public func connect(node: Node<T>, to: Node<T>, weight: Int = 1) {
        
    }
    
    public init() {
        
    }
    
    public func dfsSearch(node: Node<T>) {
        var stack = [Node<T>]()
        var visited = [Node<T>]()
        stack.append(node)
        visited.append(node)
        while !stack.isEmpty {
            let top = stack.first!
            var remove = true
            for relative in top.relaives {
                if !visited.contains(relative.to) {
                    stack.insert(relative.to, at: 0)
                    visited.append(relative.to)
                    remove = false
                    break
                }
            }
            if remove {
                stack.removeFirst()
            }
        }
        print(visited.map{$0.value})
    }
    
    public func bfsSearch(node: Node<T>) {
        var queue = [Node<T>]()
        var visited = [Node<T>]()
        queue.append(node)
        while !queue.isEmpty {
            let node = queue.removeFirst()
            for n in node.relaives {
                if !visited.contains(n.to) {
                    queue.append(n.to)
                }
            }
            if !visited.contains(node) {
                visited.append(node)
            }
        }
        print(visited.map{$0.value})
    }
    
    public func dijkstra(from: Node<T>, destination: Node<T>) {
        if from == destination {
            return
        }
        for connection in from.relaives {
            print("\(from.value) -> \(connection.to.value) costs \(connection.weight)")
            dijkstra(from: connection.to, destination: destination)
        }
    }
}
