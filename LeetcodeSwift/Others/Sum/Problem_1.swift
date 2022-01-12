//
//  Problem_1.swift
//  LeetcodeSwift
//
//  Created by Hieu Luong on 12/01/2022.
//

final class Problem_1: ProblemProtocol {
    
    static func run() {
        let problem = Problem_1()
        let nums = [2,7,11,15]
        let target = 9
        let answer = problem.twoSum(nums, target)
        print(answer)
    }
    
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int:Int]()
        for (curIndex, num) in nums.enumerated() {
            if let prevIndex = dict[target-num] {
                return [prevIndex, curIndex]
            }
            dict[num] = curIndex
        }
        return []
    }
}

