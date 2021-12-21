//
//  Problem_79.swift
//  LeetcodeSwift
//
//  Created by Hieu Luong on 21/12/2021.
//

class Problem_79: ProblemProtocol {
    
    static func run() {
        let problem = Problem_79()
        let board: [[Character]] = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]]
        let word = "ABCCED"
        let answer = problem.exist(board, word)
        print(answer)
    }
    
    private var numberOfRows: Int = 0
    private var numberOfCols: Int = 0
    
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        numberOfRows = board.count
        numberOfCols = board[0].count
        
        var board = board
               
        // O(MNK)
        for row in 0..<numberOfRows { // O(M)
            for col in 0..<numberOfCols { // O(N)
                if dfs(&board, Array(word), row, col, 0) { // O(3^L)
                    return true
                }
            }
        }
        return false
    }
    
    // Time Complexity: O(3^L)
    // For the backtracking function, initially we could have at most 4 directions to explore, but further the choices are reduced into 3 (since we won't go back to where we come from).
    // As a result, the execution trace after the first step could be visualized as a 3-ary tree, each of the branches represent a potential exploration in the corresponding direction.
    // Therefore, in the worst case, the total number of invocation would be the number of nodes in a full 3-nary tree, which is about 3^L3    
    // Space Complexity: O(L)
    private func dfs(_ board: inout [[Character]], _ word: [Character], _ curRow: Int, _ curCol: Int, _ curIndex: Int) -> Bool {
                                
        guard board[curRow][curCol] == word[curIndex] else {
            return false
        }
        
        guard curIndex < word.count-1 else {
            return true
        }
        
        let original = board[curRow][curCol]
        board[curRow][curCol] = "."
        
        for dir in dirs {
            let nextRow = curRow + dir[0]
            let nextCol = curCol + dir[1]
            if outOfBoard(nextRow, nextCol) { continue }
            if dfs(&board, word, nextRow, nextCol, curIndex+1) {
                board[curRow][curCol] = original
                return true
            }
        }
        
        board[curRow][curCol] = original
        return false
    }
    
    private let dirs = [[-1, 0], [0, -1], [1, 0], [0, 1]]
    private func outOfBoard(_ row: Int, _ col: Int) -> Bool {
        return row < 0 || row >= numberOfRows || col < 0 || col >= numberOfCols
    }
}
