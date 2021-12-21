//
//  Problem_39.swift
//  LeetcodeSwift
//
//  Created by Hieu Luong on 21/12/2021.
//

class Problem_39: ProblemProtocol {
    
    static func run() {
        let problem = Problem_39()
        let candidates = [2,3,6,7]
        let target = 7
        let answer = problem.combinationSum(candidates, target)
        print(answer)
    }
    
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        // pos 0: n possibilities
        // pos 1: n possibilities
        var answer = [[Int]]()
        var temp = [Int]()
        
        backtrack(candidates.sorted(), target, 0, 0, &temp, &answer)
        return answer
    }
    
    // Time Complexity: O( N ^ (T/M) ), where T is the target value, M is the minimal value among the candidates
    // Space Complexity: O(T/M)
    private func backtrack(_ candidates: [Int], _ target: Int, _ startIndex: Int, _ curSum: Int, _ temp: inout [Int], _ answer: inout [[Int]]) {
        
        guard curSum < target else {
            answer.append(temp)
            return
        }
        
        guard startIndex < candidates.count else {
            return
        }
        
        var curIndex = startIndex
        while curIndex < candidates.count && curSum + candidates[curIndex] <= target {
            temp.append(candidates[curIndex])
            backtrack(candidates, target, curIndex, curSum + candidates[curIndex], &temp, &answer)
            temp.removeLast()
            curIndex += 1
        }
    }
}
