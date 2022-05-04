//
//  Problem_317.swift
//  LeetcodeSwift
//
//  Created by Hieu Luong on 22/04/2022.
//

class Problem_317: ProblemProtocol {
    
    static func run() {
        let problem = Problem_317()
        let grid = [[0,2,1],
                    [1,0,2],
                    [0,1,0]]
//        let grid = [[1,0,2,0,1],[0,0,0,0,0],[0,0,1,0,0]]
        let result = problem.shortestDistance(grid)
        print(result)
    }
            
    private var m = 0, n = 0
    private var score: [[Int]] = []
    
    func shortestDistance(_ grid: [[Int]]) -> Int {
    
        m = grid.count
        n = grid[0].count
        
        score = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
        var mark = 0
        var grid = grid
        
        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == 1 {
                    mark -= 1
                    fill(&grid, row: i, col: j, mark: mark)
                }
            }
        }
        
        var result = Int.max
        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == mark {
                    result = min(result, score[i][j])
                }
            }
        }
        
        return result == Int.max ? -1 : result
    }
    
    private let dirs = [[-1, 0], [0, -1], [1, 0], [0, 1]]
    private func fill(_ grid: inout [[Int]], row: Int, col: Int, mark: Int) {
        
        var queue = Queue<(row:Int, col: Int)>()
        queue.offer((row, col))
        
        var curDistance = 0
        while !queue.isEmpty {
            curDistance += 1
            
            let size = queue.count
            for _ in 0..<size {
                let (curRow, curCol) = queue.poll()
                print((curRow, curCol))
                for dir in dirs {
                
                    let nextRow = curRow + dir[0], nextCol = curCol + dir[1]
                    if outOfGrid(nextRow, nextCol) || grid[nextRow][nextCol] != mark+1 {
                        continue
                    }
                
                    grid[nextRow][nextCol] = mark
                    score[nextRow][nextCol] += curDistance
                    queue.offer((nextRow, nextCol))
                }
            }
        }
    }
    
    private func outOfGrid(_ row: Int, _ col: Int) -> Bool {
        return row < 0 || row >= m || col < 0 || col >= n
    }
    
}
