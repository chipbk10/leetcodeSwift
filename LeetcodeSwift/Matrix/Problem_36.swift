//
//  Problem_36.swift
//  LeetcodeSwift
//
//  Created by Hieu Luong on 08/01/2022.
//

final class Problem_36: ProblemProtocol {
    
    static func run() {
        let problem = Problem_36()
        let board: [[Character]] = [
            ["5","3",".",".","7",".",".",".","."],
            ["6",".",".","1","9","5",".",".","."],
            [".","9","8",".",".",".",".","6","."],
            ["8",".",".",".","6",".",".",".","3"],
            ["4",".",".","8",".","3",".",".","1"],
            ["7",".",".",".","2",".",".",".","6"],
            [".","6",".",".",".",".","2","8","."],
            [".",".",".","4","1","9",".",".","5"],
            [".",".",".",".","8",".",".","7","9"]
        ]
        let answer = problem.isValidSudoku(board)
        print(answer)
    }
            
    func isValidSudoku(_ board: [[Character]]) -> Bool {
            
        var rows = [Int](repeating: 0, count: 9)
        var cols = [Int](repeating: 0, count: 9)
        var boxes = [Int](repeating: 0, count: 9)
        
        let zeroCharacter: Character = "0"
        let asciiValuZeroCharacter: Int = Int(zeroCharacter.asciiValue!)
        
        for row in 0..<9 {
            for col in 0..<9 {
                let char = board[row][col]
                if char == "." { continue }
                
                let number = Int(char.asciiValue!) - asciiValuZeroCharacter
                let presentNumber = 1 << number
                                
                if (rows[row] & presentNumber) != 0 {
                    return false
                }
                rows[row] |= presentNumber
                
                if (cols[col] & presentNumber) != 0 {
                    return false
                }
                cols[col] |= presentNumber
                
                let box = col/3 + (row/3)*3
                if (boxes[box] & presentNumber) != 0 {
                    return false
                }
                boxes[box] |= presentNumber
            }
        }
        
        return true
    }
    
}
