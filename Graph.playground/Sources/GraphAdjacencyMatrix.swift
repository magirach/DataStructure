import Foundation

public class GraphAdjacencyMatrix<T: Hashable> : Graph<T> {
    
    public override var description: String {
        var str = [String]()
        
        let val = nodes.map { (node) -> T in
            return node.value
        }
        str.append("\t\t\(val)")
        for (node, connection) in zip(nodes, connected) {
            str.append("\(node.value) -> \t\(connection)")
        }
        return str.joined(separator: "\n")
    }
    
    var connected = [[String]]()
    
    public override func createNode(value: T) -> Node<T> {
        let node = super.createNode(value: value)
        nodes.append(node)
        for index in 0..<connected.count {
            connected[index].append("0")
        }
        connected.append([String].init(repeating: "0", count: nodes.count))
        return node
    }
    
    public override func connect(node: Node<T>, to: Node<T>, weight: Int) {
        let connction = Connection(node: node, weight: weight)
        to.relaives.append(connction)
        let toIndex = nodes.firstIndex { (n) -> Bool in
            return n == to
        }
        
        let fromIndex = nodes.firstIndex { (n) -> Bool in
            return n == node
        }
        connected[toIndex!][fromIndex!] = "\(weight)"
    }
}

