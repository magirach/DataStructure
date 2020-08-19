import Foundation

public class BinaryTree: CustomStringConvertible {
    public var description: String {
        return diagram(for: root)
    }
    
    public init() {
        
    }
    
    public init(root: BinaryNode) {
        self.root = root
    }
    
    private func diagram(for node: BinaryNode?, _ top: String = "", _ root: String = "", _ bottom: String = "") -> String {
        guard let node = node else {
            return root + "nil\n"
        }
        if node.left == nil && node.right == nil {
            return root + "\(node.value)\n"
            
        }
        let val = diagram(for: node.right, top + "   ", top + "┌──", top + "│  ") + root + "\(node.value)\n" + diagram(for: node.left, bottom + "│  ", bottom + "└──", bottom + "   ")
        return val
    }
    
    public var root: BinaryNode?
    
    public func insert(_ value: Int) {
        root = insert(root: root, value: value)
    }
    
    private func insert(root: BinaryNode?, value: Int) -> BinaryNode? {
        guard let root = root else {
            return BinaryNode(value)
        }
        
        if value < root.value {
            root.left = insert(root: root.left,value: value)
        } else {
            root.right = insert(root: root.right,value: value)
        }
        return root
    }
    
    public func delete(_ value: Int) {
        delete(root: root, value: value)
    }
    
    private func delete(root: BinaryNode?, value: Int) -> BinaryNode? {
        guard let root = root else {
            return nil
        }
        if value < root.value {
            root.left = delete(root: root.left, value: value)
        } else if value > root.value {
            root.right = delete(root: root.right, value: value)
        } else {
            if root.left == nil {
                return root.right
            } else if root.right == nil {
                return root.left
            } else {
                var parent = root
                var succeder = root.right
                while succeder?.left != nil {
                    parent = succeder!
                    succeder = succeder?.left
                }
                if parent === root {
                    parent.right = succeder?.right
                } else {
                    parent.left = succeder?.right
                }
                root.value = succeder!.value
            }
        }
        return root
    }
}

extension BinaryTree {
    public func mirror()
    {
        mirror(root: root)
    }
    private func mirror(root: BinaryNode?) {
        guard let root = root else {
            return
        }
        mirror(root: root.left)
        mirror(root: root.right)
        
        let temp = root.left
        root.left = root.right
        root.right = temp
    }
}

extension BinaryTree {
    public func leftView() {
        var mxLevel = 0
        leftRightView(root: root,level: 1, maxLevel: &mxLevel,isLeft: true)
    }
    
    public func rightView() {
        var mxLevel = 0
        leftRightView(root: root,level: 1, maxLevel: &mxLevel, isLeft: false)
    }
    
    private func leftRightView(root: BinaryNode?, level: Int, maxLevel: inout Int, isLeft: Bool) {
//        print("\(root?.value) :: level : \(level) :: maxLevel : \(maxLevel)")
        guard let root = root else {
            return
        }
        
        if maxLevel < level {
            print(root.value)
            maxLevel = level
        }
        if isLeft {
            leftRightView(root: root.left, level: level + 1, maxLevel: &maxLevel, isLeft: isLeft)
            leftRightView(root: root.right, level: level + 1, maxLevel: &maxLevel, isLeft: isLeft)
        } else {
            leftRightView(root: root.right, level: level + 1, maxLevel: &maxLevel, isLeft: isLeft)
            leftRightView(root: root.left, level: level + 1, maxLevel: &maxLevel, isLeft: isLeft)
        }
    }
}

extension BinaryTree {
    
    public func bottomView() {
        bottomView(root: root)
    }
    
    private func bottomView(root: BinaryNode?) {
        if root == nil {
            return
        }
        
        var visibleNodes = [Int: Int]()
        
        var arrQue = [BinaryNode]()
        
        arrQue.append(root!)
        
        while !arrQue.isEmpty {
            let temp = arrQue.removeFirst()
            visibleNodes[temp.horizontalDistance] = temp.value
            
            if temp.left != nil {
                temp.left?.horizontalDistance = temp.horizontalDistance - 1
                arrQue.append(temp.left!)
            }
            
            if temp.right != nil {
                temp.right?.horizontalDistance = temp.horizontalDistance + 1
                arrQue.append(temp.right!)
            }
        }
        
        for key in visibleNodes.keys.sorted() {
            print(visibleNodes[key]!)
        }
    }
    
    public func topView() {
        topView(root: root)
    }
    
    private func topView(root: BinaryNode?) {
        if root == nil {
            return
        }
        
        
        var treeMap = [Int: Int]()
        
        var arrQue = [BinaryNode]()
        
        arrQue.append(root!)
        
        while !arrQue.isEmpty {
            let temp = arrQue.removeFirst()
            if treeMap[temp.horizontalDistance] == nil {
                treeMap[temp.horizontalDistance] = temp.value
            }
            
            if temp.left != nil {
                temp.left?.horizontalDistance = temp.horizontalDistance - 1
                arrQue.append(temp.left!)
            }
            
            if temp.right != nil {
                temp.right?.horizontalDistance = temp.horizontalDistance + 1
                arrQue.append(temp.right!)
            }
        }
        
        for key in treeMap.keys.sorted() {
            print(treeMap[key]!)
        }
    }
}

extension BinaryTree {
    public func printLevelWise() {
        let hight = root?.hight ?? 0
        for level in 1...hight {
            printLevel(root: root, level: level, fromLeft: true)
        }
    }
    
    public func printNodesAtDistance(distance: Int) {
        printLevel(root: root, level: distance, fromLeft: true)
    }
    
    public func printLevelWiseZigZag() {
        let hight = root?.hight ?? 0
        for level in 0..<hight {
            printLevel(root: root, level: level, fromLeft: (level % 2) == 0)
        }
    }
    
    public func printInOrder() {
        printInOrder(root: root)
    }
    
    public func printPreOrder() {
        printPreOrder(root: root)
    }
    
    public func printPostOrder() {
        printPostOrder(root: root)
    }
    
    private func printLevel(root: BinaryNode?, level: Int, fromLeft: Bool) {
        if root == nil {
            return
        } else if level == 0 {
            print(root!.value)
        } else if level > 0 {
            if fromLeft {
                printLevel(root: root?.left, level: level - 1, fromLeft: fromLeft)
                printLevel(root: root?.right, level: level - 1, fromLeft: fromLeft)
            } else {
                printLevel(root: root?.right, level: level - 1, fromLeft: fromLeft)
                printLevel(root: root?.left, level: level - 1, fromLeft: fromLeft)
            }
        }
    }
    
    private func printInOrder(root: BinaryNode?) {
        if root == nil {
            return
        }
        printInOrder(root: root?.left)
        print(root!.value)
        printInOrder(root: root?.right)
    }
    
    private func printPreOrder(root: BinaryNode?) {
        if root == nil {
            return
        }
        
        print(root!.value)
        printPreOrder(root: root?.left)
        printPreOrder(root: root?.right)
    }
    
    private func printPostOrder(root: BinaryNode?) {
        if root == nil {
            return
        }
        
        printPostOrder(root: root?.left)
        printPostOrder(root: root?.right)
        print(root!.value)
    }
}

extension BinaryTree {
    public func findPrecederAndSucceder(value: Int) {
        var preceder: BinaryNode?
        var succeder: BinaryNode?
        findPrecederAndSucceder(value: value, root: root, preceder: &preceder, succeder: &succeder)
        if preceder != nil {
            print("preceder : \(preceder!.value)")
        } else {
            print("preceder : N/A")
        }
        if succeder != nil {
            print("succeder : \(succeder!.value)")
        } else {
            print("succeder : N/A")
        }
    }
    
    private func findPrecederAndSucceder(value: Int, root: BinaryNode?, preceder: inout BinaryNode?, succeder: inout BinaryNode?) {
        if root == nil {
            return
        }
        
        if root!.value == value {
            if root?.left != nil {
                var temp = root?.left
                while temp?.right != nil {
                    temp = temp?.right
                }
                preceder = temp
            }
            
            if root?.right != nil {
                var temp = root?.right
                while temp?.left != nil {
                    temp = temp?.left
                }
                succeder = temp
            }
        } else if root!.value > value {
            succeder = root
            findPrecederAndSucceder(value: value, root: root?.left, preceder: &preceder, succeder: &succeder)
        } else {
            preceder = root
            findPrecederAndSucceder(value: value, root: root?.right, preceder: &preceder, succeder: &succeder)
        }
    }
}
