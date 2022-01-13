//
//  Problem_27.swift
//  LeetcodeSwift
//
//  Created by Hieu Luong on 12/01/2022.
//

final class Problem_27: ProblemProtocol {
    
    static func run() {
        let problem = Problem_27()
        var nums = [3,2,2,3]
        let val = 3
        let answer = problem.removeElement(&nums, val)
        print(answer)
    }
    
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
//        return keepRelativeOrder(&nums, val)
        return orderArbitrary(&nums, val)
    }
    
    func keepRelativeOrder(_ nums: inout [Int], _ val: Int) -> Int {
            
        let n = nums.count
        guard n > 0 else { return 0 }
        
        var insertIndex = 0
        for curIndex in 0..<n {
            if nums[curIndex] != val {
                nums[insertIndex] = nums[curIndex]
                insertIndex += 1
            }
        }
        
        return insertIndex
    }
    
    func orderArbitrary(_ nums: inout [Int], _ val: Int) -> Int {
        
        let n = nums.count
        guard n > 0 else { return 0 }
        
        var lo = 0, hi = n-1
        while lo < hi {
            if nums[lo] == val {
                nums[lo] = nums[hi]
                hi -= 1
            } else {
                lo += 1
            }
        }
        
        return hi
    }
}
