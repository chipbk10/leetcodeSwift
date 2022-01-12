//
//  Problem_26.swift
//  LeetcodeSwift
//
//  Created by Hieu Luong on 12/01/2022.
//

final class Problem_26: ProblemProtocol {
    
    static func run() {
        let problem = Problem_26()
        var nums = [0,0,1,1,1,2,2,3,3,4]
        let answer = problem.removeDuplicates(&nums)
        print(answer)
    }
    
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        
        let n = nums.count
        guard n > 0 else { return 0 }
        
        var insertedIndex = 1, curIndex = 1
        while curIndex < n {
            if nums[curIndex] != nums[curIndex-1] {
                nums[insertedIndex] = nums[curIndex]
                insertedIndex += 1
            }
        }
        
        return insertedIndex
    }
}
