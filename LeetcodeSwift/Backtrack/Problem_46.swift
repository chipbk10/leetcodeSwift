//
//  Problem_46.swift
//  LeetcodeSwift
//
//  Created by Hieu Luong on 21/12/2021.
//

class Problem_46: ProblemProtocol {
    
    static func run() {        
        let problem = Problem_46()
        let nums = [1,2,3]
        let answer = problem.permute(nums)
        print(answer)
    }
    
    func permute(_ nums: [Int]) -> [[Int]] {
        // pos 0: n possibilities
        // pos 1: n-1 possibilities
        var nums = nums
        var temp = [Int]()
        var answer = [[Int]]()
        backtrack(&nums, 0, &temp, &answer)
        return answer
    }
    
    // Time Complexity: O(N*N^N)
    // Space Complexity: O(N)
    private func backtrack(_ nums: inout [Int], _ curIndex: Int, _ temp: inout [Int], _ answer: inout [[Int]]) {
        
        let n = nums.count
        guard curIndex < n else {
            answer.append(temp) // O(N)
            return
        }
        
        for (index, value) in nums.enumerated() {
            if value <= 10 {
                
                nums[index] += 100
                temp.append(value)
                
                backtrack(&nums, curIndex+1, &temp, &answer)
                
                temp.removeLast()
                nums[index] -= 100
            }
        }
    }
}
