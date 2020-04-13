import Foundation

public class GraphAdjacencyList<T: Hashable> : Graph<T> {
    
    public override var description: String {
        var str = [String]()
        for node in nodes {
            let val = node.relaives.map { (node) -> T in
                return node.value
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
    
    public override func connect(node: Node<T>, to: Node<T>) {
        to.relaives.append(node)
    }
}
