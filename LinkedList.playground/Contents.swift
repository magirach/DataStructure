import UIKit

example(of: "Print Linkedlist in reverse using Stack") {
    var list = LinkedList<Int>()
    list.append(Node(value: 10))
    list.append(Node(value: 101))
    list.append(Node(value: 102))
    list.append(Node(value: 103))
    list.append(Node(value: 104))
    list.append(Node(value: 105))
    list.append(Node(value: 106))
    print(list)
    list.reverse()
    print(list)
    
}



example(of: "intersect") {
    let node = Node(value: 15)

    var list1 = LinkedList<Int>()
    list1.append(node)
    list1.append(Node(value: 30))
    list1.append(Node(value: 3))
    list1.append(Node(value: 6))
    list1.append(Node(value: 9))

    var list2 = LinkedList<Int>()
    list2.append(Node(value: 10))
    list2.append(Node(value: 101))
    list2.append(Node(value: 102))
    list2.append(Node(value: 103))
    list2.append(Node(value: 104))
    list2.append(Node(value: 105))
    list2.append(Node(value: 106))
    list2.append(node)

    //print(LinkedList.sortedMerge(first: list1, second: list2))
    //print(list2 + list1)
    //list1 += list1
    //print(list1)
    //list1.remove(value: 1)
    //print(list1)
    //print(list2[list2.startIndex])
    //print(list1.count)
    print(list1)
    print(list2)
    print(LinkedList.intersect(first: list1, second: list2)?.value ?? "none")

}

example(of: "Duplicate nodes") {
    var list1 = LinkedList<Int>()
    list1.append(Node(value: 30))
    list1.append(Node(value: 3))
    list1.append(Node(value: 6))
    list1.append(Node(value: 9))
    list1.append(Node(value: 30))
    list1.append(Node(value: 31))
    list1.append(Node(value: 62))
    list1.append(Node(value: 92))
    print(list1)
    list1.removeDuplicates()
    print(list1)
}

example(of: "get node at index") {
    var list1 = LinkedList<Int>()
    list1.append(Node(value: 30))
    list1.append(Node(value: 3))
    list1.append(Node(value: 6))
    list1.append(Node(value: 9))
    list1.append(Node(value: 30))
    list1.append(Node(value: 31))
    list1.append(Node(value: 62))
    list1.append(Node(value: 92))
    print(list1.node(at: 3, fromBack: true)?.value)
    print(list1.node(at: 3)?.value)
    
}

example(of: "delete middle nodes") {
    var list1 = LinkedList<Int>()
    list1.append(Node(value: 30))
    list1.append(Node(value: 3))
    list1.append(Node(value: 6))
    list1.append(Node(value: 9))
    list1.append(Node(value: 30))
    list1.append(Node(value: 31))
    list1.append(Node(value: 62))
    list1.append(Node(value: 92))
    print(list1)
    list1.deleteMiddleElement()
    print(list1)
    
}

example(of: "partitioned link list") {
    var list1 = LinkedList<Int>()
    list1.append(Node(value: 3))
    list1.append(Node(value: 5))
    list1.append(Node(value: 8))
    list1.append(Node(value: 5))
    list1.append(Node(value: 10))
    list1.append(Node(value: 2))
    list1.append(Node(value: 1))
    print(list1)
    list1.partition(at: 5)
    print(list1)
    
}

example(of: "addition fo 2 list") {
    var list1 = LinkedList<Int>()
    list1.append(Node(value: 3))
    list1.append(Node(value: 5))
    list1.append(Node(value: 8))
    
    var list2 = LinkedList<Int>()
    list2.append(Node(value: 3))
    list2.append(Node(value: 5))
    list2.append(Node(value: 8))
    let result = LinkedList<Int>.sum(lhs: list1, rhs: list2)
    print(result)
}

example(of: "isPalindrome") {
    var list1 = LinkedList<Int>()
    list1.append(Node(value: 3))
    list1.append(Node(value: 5))
    list1.append(Node(value: 8))
    list1.append(Node(value: 51))
    list1.append(Node(value: 3))
    
    print(list1.isPalindrome)
}
