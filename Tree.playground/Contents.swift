import UIKit

var str = "Hello, playground"

example(of: "Binary tree") {
    var tree = BinaryTree()
    tree.insert(9)
    tree.insert(10)
    tree.insert(11)
    tree.insert(12)
    tree.insert(13)
    tree.insert(14)
    tree.insert(1)
    tree.insert(2)
    tree.insert(3)
    tree.insert(4)
    tree.insert(5)
    tree.insert(6)
    tree.insert(7)
    tree.insert(8)
    print(tree)
}

example(of: "Binary tree") {
    var tree = BinaryTree()
    tree.insert(5)
    tree.insert(2)
    tree.insert(1)
    tree.insert(3)
    tree.insert(4)
    tree.insert(7)
    tree.insert(6)
    tree.insert(8)
    print(tree)
}


example(of: "Binary tree mirror") {
    var tree = BinaryTree()
    tree.insert(5)
    tree.insert(2)
    tree.insert(1)
    tree.insert(3)
    tree.insert(4)
    tree.insert(7)
    tree.insert(6)
    tree.insert(8)
    print(tree)
    tree.mirror()
    print(tree)
}

example(of: "Binary tree left view") {
    var tree = BinaryTree()
    tree.insert(5)
    tree.insert(2)
    tree.insert(1)
    tree.insert(3)
    tree.insert(4)
    tree.insert(7)
    tree.insert(6)
    tree.insert(8)
    print(tree)
    tree.leftView()
}

example(of: "Binary tree right view") {
    var tree = BinaryTree()
    tree.insert(5)
    tree.insert(2)
    tree.insert(1)
    tree.insert(3)
    tree.insert(4)
    tree.insert(5)
    tree.insert(11)
    tree.insert(10)
    tree.insert(7)
    tree.insert(6)
    tree.insert(8)
    print(tree)
    tree.rightView()
}

example(of: "Binary tree bottom view") {
    var tree = BinaryTree()
    tree.insert(5)
    tree.insert(2)
    tree.insert(1)
    tree.insert(3)
    tree.insert(4)
    tree.insert(5)
    tree.insert(11)
    tree.insert(15)
    tree.insert(12)
    tree.insert(10)
    tree.insert(7)
    tree.insert(6)
    tree.insert(8)
    print(tree)
    tree.bottomView()
}


example(of: "Binary tree top view") {
    var tree = BinaryTree()
    tree.insert(5)
    tree.insert(5)
    tree.insert(11)
    tree.insert(15)
    tree.insert(12)
    tree.insert(10)
    tree.insert(7)
    tree.insert(6)
    tree.insert(8)
    print(tree)
    tree.topView()
}

example(of: "Binary tree level wise") {
    var tree = BinaryTree()
    tree.insert(5)
    tree.insert(5)
    tree.insert(11)
    tree.insert(15)
    tree.insert(12)
    tree.insert(10)
    tree.insert(7)
    tree.insert(6)
    tree.insert(8)
    tree.printLevelWise()
}

example(of: "Binary tree level wise zigzag") {
    var tree = BinaryTree()
    tree.insert(5)
    tree.insert(5)
    tree.insert(11)
    tree.insert(15)
    tree.insert(12)
    tree.insert(10)
    tree.insert(7)
    tree.insert(6)
    tree.insert(8)
    tree.printLevelWiseZigZag()
}

example(of: "Binary tree in order") {
    var tree = BinaryTree()
    tree.insert(5)
    tree.insert(5)
    tree.insert(11)
    tree.insert(15)
    tree.insert(12)
    tree.insert(10)
    tree.insert(7)
    tree.insert(6)
    tree.insert(8)
    tree.printInOrder()
}

example(of: "Binary tree pre order") {
    var tree = BinaryTree()
    tree.insert(5)
    tree.insert(5)
    tree.insert(11)
    tree.insert(15)
    tree.insert(12)
    tree.insert(10)
    tree.insert(7)
    tree.insert(6)
    tree.insert(8)
    tree.printPreOrder()
}

example(of: "Binary tree post order") {
    var tree = BinaryTree()
    tree.insert(5)
    tree.insert(5)
    tree.insert(11)
    tree.insert(15)
    tree.insert(12)
    tree.insert(10)
    tree.insert(7)
    tree.insert(6)
    tree.insert(8)
    tree.printPostOrder()
}

example(of: "Binary tree preceeder and scucceder") {
    var tree = BinaryTree()
    tree.insert(50)
    tree.insert(30)
    tree.insert(40)
    tree.insert(20)
    tree.insert(70)
    tree.insert(60)
    tree.insert(80)
    tree.findPrecederAndSucceder(value: 80)
   // tree.insert(65)
    print(tree)
}

example(of: "Binary tree preceeder and scucceder") {
    var tree = BinaryTree()
    tree.insert(50)
    tree.insert(30)
    tree.insert(40)
    tree.insert(20)
    tree.insert(70)
    tree.insert(60)
    tree.insert(80)
    tree.printNodesAtDistance(distance: 2)
   // tree.insert(65)
    print(tree)
}
example(of: "Binary tree delete") {
    var tree = BinaryTree()
    tree.insert(50)
    tree.insert(30)
    tree.insert(40)
    tree.insert(20)
    tree.insert(70)
    tree.insert(60)
    tree.insert(80)
    print(tree)
    tree.delete(50)
    print(tree)
}
