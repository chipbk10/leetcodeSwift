//
//  Problem_15.swift
//  LeetcodeSwift
//
//  Created by Hieu Luong on 12/01/2022.
//


// ThreeSum: a follow up of TwoSum
// following questions: 3Sum Smaller (problem_259), 3Sum Closest (problem_16)
final class Problem_15: ProblemProtocol {
    
    static func run() {
        let problem = Problem_15()
        let nums = [-1,0,1,2,-1,-4]
        let answer = problem.threeSum(nums)
        print(answer)
    }
    
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count >= 3 else { return [] }
//        return threeSum_sort(nums)
        return threeSum_noSort(nums)
    }
    
    // Time Complexity: O( N^2 * (1+3log3) )
    private func threeSum_noSort(_ nums: [Int]) -> [[Int]] {
        var answer = [[Int]]()
        var seen = Set<Int>()
        var seenTripple = Set<String>()
        
        // O(N)
        for curIndex in 0...nums.count-3 {
            let curNum = nums[curIndex]
            if seen.contains(curNum) { continue }
                                       
            seen.insert(curNum)
            
            let arr = twoSum_noSort(nums, curIndex+1, -curNum) // O(N)
            if arr.isEmpty { continue }
            
            // O(N)
            arr.forEach {
                let sortedNums = $0.sorted() // O(3Log3)
                let key = "\(sortedNums[0]) -> \(sortedNums[1]) -> \(sortedNums[2])"
                if !seenTripple.contains(key) {
                    seenTripple.insert(key)
                    answer.append($0)
                }
            }
        }
        
        return answer
    }
    
    // Time Complexity: O(NLogN + 2N^2)
    private func threeSum_sort(_ nums: [Int]) -> [[Int]] {
        let sortedNums = nums.sorted() // O(NLogN)
        var prevNum = Int.max
        var answer = [[Int]]()
                                
        // O(N)
        for curIndex in 0...sortedNums.count-3 {
            let curNum = sortedNums[curIndex]
            if curNum == prevNum { continue }
            
            // good
            if curNum > 0 { break }
            
            prevNum = curNum
            
            let arr = twoSum_sort(sortedNums, curIndex+1, -curNum) // O(N)
            if arr.isEmpty { continue }
            answer += arr   // O(N)
        }
        
        return answer
    }
    
    private func twoSum_noSort(_ nums: [Int], _ startIndex: Int, _ K: Int) -> [[Int]] {
                        
        var seen = Set<Int>()
        var used = Set<Int>()
        var answer = [[Int]]()
        
        for curIndex in startIndex..<nums.count {
            let curNum = nums[curIndex]
            if used.contains(curNum) { continue }
                                    
            if seen.contains(K-curNum) {
                answer.append([K-curNum, curNum, -K])
                used.insert(K-curNum)
                seen.remove(K-curNum)
                used.insert(curNum)
            } else {
                seen.insert(curNum)
            }
        }
        
        return answer
    }
    
    private func twoSum_sort(_ sortedNums: [Int], _ startIndex: Int, _ K: Int) -> [[Int]] {
        
        var answer = [[Int]]()
        var lo = startIndex, hi = sortedNums.count-1, sum = Int.max
                
        while lo < hi {
            
            // good
            if sortedNums[lo] > K - sortedNums[lo] { break }
                        
            sum = sortedNums[lo] + sortedNums[hi]
            if sum < K {
                lo += 1
            } else if sum > K {
                hi -= 1
            } else {
                answer.append([sortedNums[lo], sortedNums[hi], -K])
                repeat { lo += 1 } while lo < hi && sortedNums[lo] == sortedNums[lo-1]
                repeat { hi -= 1 } while lo < hi && sortedNums[hi] == sortedNums[hi+1]
            }
        }
        return answer
    }
}
