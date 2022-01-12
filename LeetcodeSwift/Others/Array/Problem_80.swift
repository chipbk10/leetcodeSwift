//
//  Problem_80.swift
//  LeetcodeSwift
//
//  Created by Hieu Luong on 12/01/2022.
//

final class Problem_80: ProblemProtocol {
    
    static func run() {
        let problem = Problem_80()
        var nums = [1,1,1,2,2,3]
        let answer = problem.removeDuplicates(&nums)
        print(answer)
    }
    
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        let n = nums.count
        guard n >= 2 else { return n }
        
        var insertIndex = 1, duplicates = 0
        for curIndex in 1..<n {
            if nums[curIndex] == nums[curIndex-1] {
                duplicates += 1
            } else {
                duplicates = 0
            }
            
            if duplicates < 2 {
                nums[insertIndex] = nums[curIndex]
                insertIndex += 1
            }
        }
        
        return insertIndex
    }
}
