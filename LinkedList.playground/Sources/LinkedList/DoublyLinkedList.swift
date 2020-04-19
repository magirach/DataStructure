import Foundation

import Foundation

public struct DoublyLinkedList<Value: Comparable> {
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
        let newNode = Node(value: value, next: head)
        head?.previous = newNode
        head = newNode
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
        tail?.next?.previous = tail
        tail = tail!.next
    }
    
    public mutating func append(_ node: Node<Value>) {
        guard !isEmpty else {
            head = node
            tail = node
            return
        }
        tail!.next = node
        node.previous = tail
        tail = node
    }
    
    
    public func node(at index: Int) -> Node<Value>? {
        var currentNode = head
        var currentIndex = 0
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
        node.next?.previous = node
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
            node.next?.previous = node
        }
        return node.next?.value
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

extension DoublyLinkedList: CustomStringConvertible {
    public var description: String {
        guard let head = head else {
            return "Empty list"
        }
        return String(describing: head)
    }
}

extension DoublyLinkedList {
    
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

extension DoublyLinkedList {
    static public func +=( lhs: inout DoublyLinkedList<Value>, rhs: DoublyLinkedList<Value>) {
        var current = rhs.head
        while let c = current {
            lhs.append(c.value)
            current = current?.next
        }
    }
    
    public static func +(lhs: DoublyLinkedList<Value>, rhs: DoublyLinkedList<Value>) -> DoublyLinkedList<Value> {
        var joined = DoublyLinkedList()
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
    
    public static func sortedMerge(first: DoublyLinkedList<Value>, second: DoublyLinkedList<Value>) -> DoublyLinkedList<Value> {
        var mergedList = DoublyLinkedList<Value>()
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

extension DoublyLinkedList {
    public static func intersect(first: DoublyLinkedList<Value>, second: DoublyLinkedList<Value>) -> Node<Value>? {
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
    
    private static func getIntersectNode(first: DoublyLinkedList<Value>, second: DoublyLinkedList<Value>, diff: Int) -> Node<Value>? {
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
