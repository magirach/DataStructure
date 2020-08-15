func allFibonacii(upto: Int) -> [Int] {
    var memory = [Int].init(repeating: 0, count: upto)
    for i in 0..<upto {
        fibonaci(value: i, memory: &memory)
    }
    return memory
}

func fibonaci(value: Int, memory: inout [Int]) -> Int {
    if value <= 0 {
        memory[value] = 0
        return 0
    } else if value == 1 {
        memory[value] = 1
        return 1
    } else if memory[value] > 0 {
        return memory[value]
    }
    
    memory[value] = fibonaci(value: value - 1, memory: &memory) + fibonaci(value: value - 2, memory: &memory)
    return memory[value]
}

print(allFibonacii(upto: 40))
