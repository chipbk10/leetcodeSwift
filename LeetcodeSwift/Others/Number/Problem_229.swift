//
//  Problem_229.swift
//  LeetcodeSwift
//
//  Created by Hieu Luong on 11/01/2022.
//

final class Problem_229: ProblemProtocol {
    
    static func run() {
        let problem = Problem_229()
        let nums = [3,2,3,4,5,3,1,6]
        let answer = problem.majorityElement(nums)
        print(answer)
    }
    
    func majorityElement(_ nums: [Int]) -> [Int] {
            
        var count1 = 0, candidate1: Int? = nil
        var count2 = 0, candidate2: Int? = nil
        
        for num in nums {
            if let candidate1 = candidate1, candidate1 == num {
                count1 += 1
            } else if let candidate2 = candidate2, candidate2 == num {
                count2 += 1
            } else if count1 == 0 {
                candidate1 = num
                count1 = 1
            } else if count2 == 0 {
                candidate2 = num
                count2 = 1
            } else {
                count1 -= 1
                count2 -= 1
            }
        }
        
        var answer: [Int] = []
        count1 = 0
        count2 = 0
        for num in nums {
            if let candidate1 = candidate1, candidate1 == num {
                count1 += 1
            }
            if let candidate2 = candidate2, candidate2 == num {
                count2 += 1
            }
        }
        
        if count1 > nums.count/3 {
            answer.append(candidate1!)
        }
        
        if count2 > nums.count/3 {
            answer.append(candidate2!)
        }
        
        return answer
    }
    
}
