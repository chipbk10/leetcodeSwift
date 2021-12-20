//
//  Problem_329.swift
//  LeetcodeSwift
//
//  Created by Hieu Luong on 20/12/2021.
//

class Problem_329: ProblemProtocol {
    
    static func run() {
        
        let problem = Problem_329()
        let matrix = [
            [9,9,4],
            [6,6,8],
            [2,1,1]
        ]
        let answer = problem.longestIncreasingPath(matrix)
        print("answer = \(answer)")
    }
        
    private var numberOfRows: Int = 0
    private var numberOfCols: Int = 0
    
    func longestIncreasingPath(_ matrix: [[Int]]) -> Int {
        numberOfRows = matrix.count
        numberOfCols = matrix[0].count
//        return dfs_approach(matrix)
        return topological_approach(matrix)
    }
    
    
    // peeling onion
    // time complexity: 0(mn)
    // topological sort is O(V+E), here V is the total number of vertices (= mn), and E is the number of edges (= 4*mn)
    // space complexity: O(mn)
    private func topological_approach(_ matrix: [[Int]]) -> Int {
        
        // set up a matrix that contains degrees of all nodes
        var degrees = [[Int]](repeating: [Int](repeating: 0, count: numberOfCols), count: numberOfRows)
        
        // set up a queue to do bfs
        var queue = Queue<(Int, Int)>()
        
        // iterate over the matrix to build up the dependencies relationship between nodes
        for row in 0..<numberOfRows {
            for col in 0..<numberOfCols {
                for dir in dirs {
                    let nextRow = row + dir[0]
                    let nextCol = col + dir[1]
                    if outOfMatrix(nextRow, nextCol) { continue }
                    if matrix[nextRow][nextCol] >= matrix[row][col] { continue }
                    degrees[row][col] += 1
                }
                if degrees[row][col] == 0 {
                    queue.offer((row, col))
                }
            }
        }
        
        // do bfs
        var answer = 0
        while !queue.isEmpty {
            
            var size = queue.count
            while size > 0 {
                let (curRow, curCol) = queue.poll()
                for dir in dirs {
                    let nextRow = curRow + dir[0]
                    let nextCol = curCol + dir[1]
                    if outOfMatrix(nextRow, nextCol) { continue }
                    if matrix[nextRow][nextCol] <= matrix[curRow][curCol] { continue }
                    degrees[nextRow][nextCol] -= 1
                    if degrees[nextRow][nextCol] == 0 {
                        queue.offer((nextRow, nextCol))
                    }
                }
                size -= 1
            }
            
            answer += 1
        }
        
        return answer
    }
    
    private func dfs_approach(_ matrix: [[Int]]) -> Int {
        var scores = [[Int]](repeating: [Int](repeating: 0, count: numberOfCols), count: numberOfRows)
        var answer = 0
        for row in 0..<numberOfRows {
            for col in 0..<numberOfCols {
                answer = max(answer, dfs(matrix, &scores, row, col))
            }
        }
        return answer
    }
    
    let dirs = [[-1, 0], [0, -1], [1, 0], [0, 1]]
    private func dfs(_ matrix: [[Int]], _ scores: inout [[Int]], _ curRow: Int, _ curCol: Int) -> Int {
        guard scores[curRow][curCol] == 0 else { return scores[curRow][curCol] }
        var answer = 1
        for dir in dirs {
            let nextRow = curRow + dir[0]
            let nextCol = curCol + dir[1]
            if outOfMatrix(nextRow, nextCol) { continue }
            if matrix[nextRow][nextCol] <= matrix[curRow][curCol] { continue }
            answer = max(answer, 1+dfs(matrix, &scores, nextRow, nextCol))
        }
        scores[curRow][curCol] = answer
        return answer
    }
    
    private func outOfMatrix(_ row: Int, _ col: Int) -> Bool {
        return row < 0 || row >= numberOfRows || col < 0 || col >= numberOfCols
    }
}
