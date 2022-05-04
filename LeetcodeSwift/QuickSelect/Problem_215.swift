//
//  Problem_215.swift
//  LeetcodeSwift
//
//  Created by Hieu Luong on 16/04/2022.
//

final class Problem_215: ProblemProtocol {
    
    static func run() {
        let problem = Problem_215()
        let nums = [3,2,1,5,6,4]
        let k = 2
        let result = problem.findKthLargest(nums, k)
        print(result)
    }
    
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
            
        let n = nums.count
        var startIndex = 0, endIndex = n-1, nums = nums
        
        while startIndex <= endIndex {
            
            let pivotIndex = quickSelect(array: &nums, startIndex: startIndex, endIndex: endIndex)
            if pivotIndex == n-k { return nums[pivotIndex] }
            
            if pivotIndex < n-k {
                startIndex = pivotIndex+1
            } else {
                endIndex = pivotIndex-1
            }
        }
        
        return 0
    }
    
    // quickSelect return a index i. This element is positioned correctly at index i after the quick select
    private func quickSelect(array: inout [Int], startIndex: Int, endIndex: Int) -> Int {
        
        var startIndex = startIndex, endIndex = endIndex
        var pivotIndex = Int.random(in: startIndex...endIndex)
        let pivotValue = array[pivotIndex]
        
        // move pivot to the startIndex
        swap(array: &array, i: startIndex, j: pivotIndex)
        pivotIndex = startIndex
        startIndex += 1
                
        // startIndex ... pivotIndex ... endIndex
        while startIndex <= endIndex {
            while startIndex <= endIndex && array[startIndex] <= pivotValue {
                startIndex += 1
            }
            while startIndex <= endIndex && array[endIndex] > pivotValue {
                endIndex -= 1
            }
            if startIndex < endIndex {
                swap(array: &array, i: startIndex, j: endIndex)
            }
        }
               
        // swap pivot & endIndex
        swap(array: &array, i: pivotIndex, j: endIndex)
        return endIndex
    }
    
    private func swap(array: inout [Int], i: Int, j: Int) {
        guard i != j else { return }
        let tmp = array[i]
        array[i] = array[j]
        array[j] = tmp
    }
}
