//
//  Problem_53.swift
//  LeetcodeSwift
//
//  Created by Hieu Luong on 01/01/2022.
//

final class Problem_53: ProblemProtocol {
    
    static func run() {
        let problem = Problem_53()
        let nums = [-2,1,-3,4,-1,2,1,-5,4]
        let answer = problem.maxSubArray(nums)
        print(answer)
    }
    
    func maxSubArray(_ nums: [Int]) -> Int {
        return devideAndConquer_approach(nums)
    }
    
    // Time Complexity: O(NLogN)
    // Space Complexity: O(LogN) = the depth of the recursion function
    private func devideAndConquer_approach(_ nums: [Int]) -> Int {
        return findMaxSubArray(nums, 0, nums.count-1)
    }
        
    private func findMaxSubArray(_ nums: [Int], _ start: Int, _ end: Int) -> Int {
        guard start <= end else { return Int.min }
        
        let mid = start + (end-start)/2
        var maxLeftSum = 0, sum = 0, i = mid-1
        while i >= start {
            sum += nums[i]
            maxLeftSum = max(maxLeftSum, sum)
            i -= 1
        }
        var maxRightSum = 0
        sum = 0
        i = mid+1
        while i <= end {
            sum += nums[i]
            maxRightSum = max(maxRightSum, sum)
            i += 1
        }
        
        var answer = maxLeftSum + nums[mid] + maxRightSum
        let maxLeft = findMaxSubArray(nums, start, mid-1)       // LogN
        let maxRight = findMaxSubArray(nums, mid+1, end)        // LogN
        answer = max(answer, maxLeft)
        answer = max(answer, maxRight)
        return answer
    }
    
    // O(N), O(1)
    private func suffix_approach(_ nums: [Int]) -> Int {
        var sumSoFar = nums[0], minSumFromStart = nums[0], maxSoFar = nums[0]
        for i in 1..<nums.count {
            let num = nums[i]
            sumSoFar += num
            maxSoFar = max(maxSoFar, sumSoFar)
            maxSoFar = max(maxSoFar, num)
            maxSoFar = max(maxSoFar, sumSoFar-minSumFromStart)
            minSumFromStart = min(minSumFromStart, sumSoFar)
        }
        return maxSoFar
    }
    
    // O(N), O(1)
    private func kadane_approach(_ nums: [Int]) -> Int {
        var maxSoFar = nums[0], maxAtEnd = nums[0]
        for i in 1..<nums.count {
            let num = nums[i]
            maxAtEnd = max(maxAtEnd+num, num)
            maxSoFar = max(maxSoFar, maxAtEnd)
        }
        return maxSoFar
    }
    
    
}
