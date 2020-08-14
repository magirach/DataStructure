func BinarySum(number1: String, number2: String) -> String {
    var output: String = ""
    let revNumber1 = number1.reversed().map { (element) -> Int in
        return Int(String(element))!
    }
    let revNumber2 = number2.reversed().map { (element) -> Int in
        return Int(String(element))!
    }
    let maxLength = max(revNumber1.count, revNumber2.count)
    var carryForward = 0
    for i in 0..<maxLength {
        var temp = carryForward
        if i < number1.count {
            temp += revNumber1[i] - 0
        }
        if i < number2.count {
            temp += revNumber2[i] - 0
        }
        carryForward = temp / 2
        output.append(contentsOf: temp % 2 == 0 ? "0" : "1")
    }
    output.append(contentsOf: carryForward == 1 ? "1" : "")
    
    return String(output.reversed())
}

print(BinarySum(number1: "11101010101", number2: "1110101010111101010101"))
