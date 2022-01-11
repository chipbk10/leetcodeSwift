//
//  Problem_169.swift
//  LeetcodeSwift
//
//  Created by Hieu Luong on 11/01/2022.
//

final class Problem_169: ProblemProtocol {
    
    static func run() {
        let problem = Problem_169()
        let nums = [3,2,3]
        let answer = problem.majorityElement(nums)
        print(answer)
    }
    
    func majorityElement(_ nums: [Int]) -> Int {
        return boyerMoore_approach(nums)
    }
    
    private func boyerMoore_approach(_ nums: [Int]) -> Int {
        var answer = 0
        var count = 0
        for num in nums {
            if count == 0 {
                answer = num
            }
            count += answer == num ? 1 : -1
        }
        return answer
    }
    
    // Another easy solution: K being a majority item means that every bit value of K is majority.
    // We can then reconstruct K from the majority bit values.
    private func bit_approach(_ nums: [Int]) -> Int {
        var answer : Int32 = 0
        
        for i in 0..<32 {
            
            var ones = 0, zeros = 0
            
            for num in nums {
                if (num & (1<<i)) != 0 {
                    ones += 1
                } else {
                    zeros += 1
                }
            }
            
            if ones > zeros {
                answer |= 1<<i
            }
        }
        
        return Int(answer)
    }
}
