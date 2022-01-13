//
//  Problem_31.swift
//  LeetcodeSwift
//
//  Created by Hieu Luong on 13/01/2022.
//

final class Problem_31: ProblemProtocol {
    
    static func run() {        
        let problem = Problem_31()
        var nums = [1,3,2,1,0]
        problem.nextPermutation(&nums)
        print(nums)
    }
    
    func nextPermutation(_ nums: inout [Int]) {
            
        let n = nums.count
        var i = n-2
        
        // [1,3,2,1,0]
        // [1,3,2,0]
        while i >= 0 && nums[i+1] <= nums[i] {
            i -= 1
        }
        
        if (i >= 0) {
            var j = n-1
            while nums[j] <= nums[i] {
                j -= 1
            }
            swap(&nums, i, j)
        }
        
        reverse(&nums, i+1, n-1)
    }
    
    private func reverse(_ nums: inout [Int], _ startIndex: Int, _ endIndex: Int) {
        var lo = startIndex, hi = endIndex
        while lo < hi {
            let tmp = nums[lo]
            nums[lo] = nums[hi]
            nums[hi] = tmp
            lo += 1
            hi -= 1
        }
    }
    
    private func swap(_ nums: inout [Int], _ i: Int, _ j: Int) {
        guard i != j else { return }
        let tmp = nums[i]
        nums[i] = nums[j]
        nums[j] = tmp
    }
}
