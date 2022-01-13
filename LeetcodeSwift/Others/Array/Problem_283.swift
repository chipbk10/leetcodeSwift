//
//  Problem_283.swift
//  LeetcodeSwift
//
//  Created by Hieu Luong on 12/01/2022.
//

final class Problem_283: ProblemProtocol {
    
    static func run() {
        let problem = Problem_283()
        var nums = [0,1,0,3,12]
        problem.moveZeroes(&nums)
        print(nums)        
    }
    
    func moveZeroes(_ nums: inout [Int]) {
//        return useInsertIndexTechnique(&nums)
        return lessOperations(&nums)
    }
    
    private func useInsertIndexTechnique(_ nums: inout [Int]) {
        var insertIndex = 0
        for curValue in nums {
            if curValue != 0 {
                nums[insertIndex] = curValue
                insertIndex += 1
            }
        }
        
        while insertIndex < nums.count {
            nums[insertIndex] = 0
            insertIndex += 1
        }
    }
    
    private func lessOperations(_ nums: inout [Int]) {
        // lo -> point to zero element
        // hi -> point to no-zero element
        // swap
        
        let n = nums.count
        var lo = 0
        
        for hi in 0..<n {
            if nums[hi] != 0 {
                if lo != hi {
                    nums[lo] = nums[hi]
                    nums[hi] = 0
                }
                lo += 1
            }
        }
    }
}
