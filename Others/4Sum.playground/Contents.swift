func findPair(array: [Int], target: Int) -> [[Int]] {
    var arrOutput = [[Int]]()
    let input = array.sorted()
    for i in 0..<(input.count - 3) {
        for j in (i+1)..<(input.count - 2) {
            var left = j + 1
            var right = input.count - 1
            
            while left < right {
                let sum = input[i] + input[j] + input[left] + input[right]
                if sum == target {
                    let pair = [input[i], input[j], input[left], input[right]]
                    if !arrOutput.contains(pair) {
                        arrOutput.append(pair)
                    }
                    left += 1
                    right -= 1
                } else if (sum < target) {
                    left += 1
                } else {
                    right -= 1
                }
            }
        }
        
    }
    return arrOutput
}

print(findPair(array: [1,0,-1,0,-2,2,3, 4,-2,1,-5,-2, -100, 90, 6,5,7,8,-5,-7,-20,-33], target: 0))
