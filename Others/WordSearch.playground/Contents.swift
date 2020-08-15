func searchWord(board: inout [[Character]], word: [Character], rowId: Int = 0, colId: Int = 0) -> Bool {
    print(word)
    var result = false
    if word.isEmpty {
        return true
    }
    if board[rowId][colId] == word[0] {
        var w = word
        w.removeFirst()
        board[rowId][colId] = Character("_")
        if word.isEmpty {
            result = true
        } else {
            var nextCol = 0
            var nextRow = 0
            if colId + 1 == board[0].count {
                nextCol = 0
                if rowId + 1 == board.count {
                    return false
                } else {
                    nextRow = rowId + 1
                }
            } else {
                nextCol = colId + 1
                nextRow = rowId
            }
            result = searchWord(board: &board, word: w, rowId: nextRow, colId: nextCol)
        }
    }
    return result
}

func search(board:[String], word: String) -> Bool {
    var arrBoard = board.map { (str) -> [Character] in
        return Array(str)
    }
    let words = Array(word)
    return searchWord(board: &arrBoard, word: words)
}

search(board: ["moin","gira","farh"], word: "moin")
