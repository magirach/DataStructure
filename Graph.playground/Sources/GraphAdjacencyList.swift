import Foundation

public class GraphAdjacencyList<T: Hashable> : Graph<T> {
    
    public override var description: String {
        var str = [String]()
        for node in nodes {
            let val = node.relaives.map { (connection) -> T in
                return connection.to.value
            }
            str.append("\(node.value) -> \(val)")
        }
        return str.joined(separator: "\n")
    }
        
    public override func createNode(value: T) -> Node<T> {
        let node = super.createNode(value: value)
        nodes.append(node)
        return node
    }
    
    public override func connect(node: Node<T>, to: Node<T>, weight: Int = 1) {
        let connect = Connection(node: node, weight: weight)
        to.relaives.append(connect)
    }
}
