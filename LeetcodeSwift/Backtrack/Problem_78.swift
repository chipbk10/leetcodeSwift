//
//  Problem_78.swift
//  LeetcodeSwift
//
//  Created by Hieu Luong on 21/12/2021.
//

class Problem_78: ProblemProtocol {
    
    static func run() {
        let problem = Problem_78()
        let nums = [1,2,3]
        let answer = problem.subsets(nums)
        print(answer)
    }
    
    func subsets(_ nums: [Int]) -> [[Int]] {
//        return backtrack_approach(nums)
        return bitManipulation_approach(nums)
    }
    
    // Time Complexity: O(N * 2^N)
    // Space Complexity: O(N)
    private func bitManipulation_approach(_ nums: [Int]) -> [[Int]] {
        var answer = [[Int]]()
        let n = nums.count
        let total = 1 << n
                
        for i in 0..<total { // O(2^N)
            
            var temp = [Int]()
            var j = 0
            while (1 << j) <= i { // O(N)
                if i & (1<<j) != 0 { temp.append(nums[j]) }
                j += 1
            }
            answer.append(temp)
        }
        
        return answer
    }
    
    private func backtrack_approach(_ nums: [Int]) -> [[Int]] {
        var answer = [[Int]]()
        var temp = [Int]()
        answer.append([])
        backtrack(nums, 0, &temp, &answer)
        return answer
    }
    
    // Time Complexity: O(2^N)
    // Space Complexity: O(N)
    private func backtrack(_ nums: [Int], _ startIndex: Int, _ temp: inout [Int], _ answer: inout [[Int]]) {
        
        let n = nums.count
        guard startIndex < n else { return }
        
        for curIndex in startIndex..<n {
            temp.append(nums[curIndex])
            answer.append(temp)
            backtrack(nums, curIndex+1, &temp, &answer)
            temp.removeLast()
        }
    }
    
}
