//
//  Problem_22.swift
//  LeetcodeSwift
//
//  Created by Hieu Luong on 21/12/2021.
//

class Problem_22: ProblemProtocol {
    
    static func run() {
        let problem = Problem_22()
        let n = 3
        let answer = problem.generateParenthesis(n)
        print(answer)
    }
    
    func generateParenthesis(_ n: Int) -> [String] {
        // pos 0 : open
        // pos 1 : open | close
        // pos 2 : if opens > 0 --> open | close
        var temp = [Character]()
        var answer = [String]()
        backtrack(n, 0, 0, 0, &temp, &answer)
        return answer
    }
    
    // Time Complexity: O(N * 2^2N)
    // Space Complexity: O(2N)
    private func backtrack(_ n: Int, _ index: Int, _ opens: Int, _ closes: Int, _ temp: inout [Character], _ answer: inout [String]) {
        
        guard index < 2*n else {
            if !temp.isEmpty {
                answer.append(String(temp)) // O(N)
            }
            return
        }
        
        if opens > closes {
            temp.append(")")
            backtrack(n, index+1, opens, closes+1, &temp, &answer)
            temp.removeLast()
        }
        
        if opens < n {
            temp.append("(")
            backtrack(n, index+1, opens+1, closes, &temp, &answer)
            temp.removeLast()
        }
    }
}
