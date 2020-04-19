import Foundation

public struct LinkedList<Value: Comparable> {
    public var head: Node<Value>?
    public var tail: Node<Value>?
    
    public init() {
        
    }
    
    public var count: Int {
        return getNodes()    
    }
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public mutating func push(_ value: Value) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    public mutating func append(_ value: Value) {
        guard !isEmpty else {
            push(value)
            return
        }
        tail!.next = Node(value: value)
        tail = tail!.next
    }
    
    public mutating func append(_ node: Node<Value>) {
        guard !isEmpty else {
            head = node
            tail = node
            return
        }
        tail!.next = node
        tail = node
    }
    
    
    public func node(at index: Int, fromBack: Bool = false) -> Node<Value>? {
        var currentNode = head
        var currentIndex = 0
        var index = index
        if fromBack {
            index = self.count - index
        }
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode!.next
            currentIndex += 1
        }
        return currentNode
    }
    
    @discardableResult
    public mutating func insert(_ value: Value, after node: Node<Value>) -> Node<Value> {
        guard tail !== node else {
            append(value)
            return tail!
        }
        
        node.next = Node(value: value, next: node.next)
        return node.next!
    }
    
    @discardableResult
    public mutating func pop() -> Value? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    
    @discardableResult
    public mutating func removeLast() -> Value? {
        guard let head = head else {
            return nil
        }
        guard head.next != nil else {
            return pop()
        }
        var prev = head
        var current = head
        while let next = current.next {
            prev = current
            current = next
        }
        prev.next = nil
        tail = prev
        return current.value
    }
    
    @discardableResult
    public mutating func remove(after node: Node<Value>) -> Value? {
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        return node.next?.value
    }
    
    public mutating func remove(node: Node<Value>) {
        while let head = head, head === node {
            self.head = head.next
        }
        
        var prev = head
        var current = head?.next
        while let currentNode = current {
            guard currentNode !== node else {
                prev?.next = currentNode.next
                current = prev?.next
                continue
            }
            prev = current
            current = current?.next
        }
    }
    
    func getNodes() -> Int {
        var count = 0
        var temp = head
        repeat {
            count += 1
            temp = temp?.next
        } while temp != nil
        return count
    }
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        guard let head = head else {
            return "Empty list"
        }
        return String(describing: head)
    }
}

extension LinkedList {
    public mutating func reverse() {
        var prev = head
        var current = head?.next
        prev?.next = nil
        while current != nil {
            let next = current?.next
            current?.next = prev
            prev = current
            current = next
        }
        head = prev
    }
    
    public mutating func remove(value: Value) {
        while let head = head, head.value == value {
            self.head = head.next
        }
        
        var prev = head
        var current = head?.next
        while let currentNode = current {
            guard currentNode.value != value else {
                prev?.next = currentNode.next
                current = prev?.next
                continue
            }
            prev = current
            current = current?.next
        }
    }
}

extension LinkedList {
    static public func +=( lhs: inout LinkedList<Value>, rhs: LinkedList<Value>) {
        var current = rhs.head
        while let c = current {
            lhs.append(c.value)
            current = current?.next
        }
    }
    
    public static func +(lhs: LinkedList<Value>, rhs: LinkedList<Value>) -> LinkedList<Value> {
        var joined = LinkedList()
        var current = lhs.head
        while let c = current {
            joined.append(c.value)
            current = current?.next
        }
        current = rhs.head
        while let c = current {
            joined.append(c.value)
            current = current?.next
        }
        return joined
    }
    
    public static func sortedMerge(first: LinkedList<Value>, second: LinkedList<Value>) -> LinkedList<Value> {
        var mergedList = LinkedList<Value>()
        var cFirst = first.head
        var cSecond = second.head
        
        while cFirst != nil ||  cSecond != nil {
            if cFirst == nil {
                mergedList.append(cSecond!.value)
                cSecond = cSecond?.next
            } else if cSecond == nil {
                mergedList.append(cFirst!.value)
                cFirst = cFirst?.next
            } else if cFirst!.value < cSecond!.value {
                mergedList.append(cFirst!.value)
                cFirst = cFirst?.next
            } else {
                mergedList.append(cSecond!.value)
                cSecond = cSecond?.next
            }
        }
        return mergedList
    }
}

extension LinkedList {
    public static func intersect(first: LinkedList<Value>, second: LinkedList<Value>) -> Node<Value>? {
        let firstLength = first.count
        let secondLength = second.count
        print(firstLength)
        print(secondLength)
        var diff = 0
        if firstLength > secondLength {
            diff = firstLength - secondLength
            print(diff)
            return getIntersectNode(first: first, second: second, diff: diff)
        } else {
            diff = secondLength - firstLength
            return getIntersectNode(first: second, second: first, diff: diff)
        }
    }
    
    private static func getIntersectNode(first: LinkedList<Value>, second: LinkedList<Value>, diff: Int) -> Node<Value>? {
        var head1 = first.head
        var head2 = second.head
        
        for _ in 0..<diff {
            head1 = head1?.next
        }
        
        while head1 != nil && head2 != nil {
            if head1 === head2 {
                return head1
            }
            head1 = head1?.next
            head2 = head2?.next
        }
        return nil
    }
}

infix operator ⊕ 
extension LinkedList {
    public mutating func removeDuplicates() {
        var current = head
        var arr = [Node<Value>]()
        while current != nil {
            if arr.contains(current!) {
                remove(node: current!)
            } else {
                arr.append(current!)
            }
            current = current!.next
        }
    }
    
    public mutating func deleteMiddleElement() {
        var current = head
        var current2 = head
        var currentPrevious = current2
        while current2 != nil {
            currentPrevious = current
            current = current?.next
            current2 = current2?.next?.next
        }
        currentPrevious?.next = current?.next
    }
    
    public mutating func partition(at: Value) {
        var list1 = LinkedList<Value>()
        var current = head
        while current != nil {
            if current!.value < at {
                list1.push(current!.value)
            } else {
                list1.append(current!.value)
            }
            current = current?.next
        }
        self.head = list1.head
    }
    
    public static func sum(lhs: LinkedList<Int>, rhs: LinkedList<Int>) -> LinkedList<Int> {
        var result = LinkedList<Int>()
        var carryForward = 0
        
        var current1 = lhs.head
        var current2 = rhs.head
        while current1 != nil && current2 != nil {
            let tempResult = current1!.value + current2!.value + carryForward
            let resultNode = tempResult % 10
            carryForward = (tempResult - resultNode) / 10
            result.append(resultNode)
            current1 = current1?.next
            current2 = current2?.next
        }
        if carryForward > 0 {
            result.append(carryForward)
        }
        
        return result
    }
    
    public var isPalindrome: Bool {
        var reverse = LinkedList<Value>()
        var current = head
        while current != nil {
            reverse.push(current!.value)
            current = current!.next
        }
        var current1 = head
        var current2 = reverse.head
        while current1 != nil && current2 != nil {
            if current1!.value != current2!.value {
                return false
            }
            current1 = current1!.next
            current2 = current2!.next
        }
        return true
    }
}
