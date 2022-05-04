//
//  Problem_498.swift
//  LeetcodeSwift
//
//  Created by Hieu Luong on 18/04/2022.
//

final class Problem_498: ProblemProtocol {
    static func run() {
        let problem = Problem_498()
        let mat = [
            [1,2,3],
            [4,5,6],
            [7,8,9]
        ]
        let result = problem.findDiagonalOrder(mat)
        print(result)
    }
    
    private let RIGHT = 0, LEFT = 1
    private var m = 0, n = 0, d = 0, i = 0, j = 0
    
    func findDiagonalOrder(_ mat: [[Int]]) -> [Int] {
        
        m = mat.count
        n = mat[0].count
        var result = [Int]()
        
        while result.count < m*n {
            result.append(mat[i][j])
            move()
        }
        
        return result
    }
    
    private func move() {
        i += d == RIGHT ? -1 : +1
        j += d == RIGHT ? +1 : -1
        if outOfMat() {
            handleBorder()
        }
    }
    
    private func handleBorder() {
        
        if i < 0 && j >= n {
            // case 2: (i,j) = (-1,3) ==> (1,2)
            i = 1
            j = n-1
            d = d == RIGHT ? LEFT : RIGHT
            return
        }
        
        if i >= m && j < 0 {
            // (3,-1) ==> (2,1)
            i = m-1
            j = 1
            d = d == RIGHT ? LEFT : RIGHT
            return
        }
        
        if i < 0 {
            // case 1: (i,j) = (-1,1) ==> (0,1)
            i = 0
        } else if i >= m {
            // case 1: (i,j) = (3,0) ==> (2,2)
            i = m-1
            j += 2
        } else if j < 0 {
            // case: (i,j) = (2,-1) ==> (2,0)
            j = 0
        } else if j >= n {
            // case: (i,j) = (0,3) ==> (2,2)
            j = n-1
            i += 2
        }
        
        d = d == RIGHT ? LEFT : RIGHT
    }
    
    private func outOfMat() -> Bool {
        return i < 0 || i >= m || j < 0 || j >= n
    }
    
    
}
