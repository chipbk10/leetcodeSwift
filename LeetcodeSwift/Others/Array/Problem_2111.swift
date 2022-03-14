//
//  Problem_2111.swift
//  LeetcodeSwift
//
//  Created by Hieu Luong on 14/03/2022.
//

final class Problem_2111: ProblemProtocol {
    
    static func run() {
        let problem = Problem_2111()
        let arr = [4,1,5,2,6,2]
        let k = 2
        let answer = problem.kIncreasing(arr, k)
        print(answer)
    }
    
    func kIncreasing(_ arr: [Int], _ k: Int) -> Int {
        var result = 0
        for i in 0..<k {
            let (actualLen, longestLen) = findLongestNonDecreasingSubsequence(array: arr, startIndex: i, difference: k)
            result += actualLen - longestLen
        }
        return result
    }
    
    private func findLongestNonDecreasingSubsequence(array: [Int], startIndex: Int, difference diff: Int) -> (actualLen:Int, result:Int) {
        var A = [Int](), index = startIndex
        var actualLen = 0
                
        while index < array.count {
            
            actualLen += 1
            let insertedNumber = array[index]
            
            // find the smallest index such that A[index] > number
            let insertIndex = binarySearch(array: A, number: insertedNumber)
            if insertIndex == A.count {
                A.append(insertedNumber)
            } else {
                A[insertIndex] = insertedNumber
            }
            
            index += diff
        }
        return (actualLen: actualLen, result: A.count)
    }
    
    // find the smallest index such that A[index] > number
    private func binarySearch(array: [Int], number: Int) -> Int {
        var lo = 0, hi = array.count-1
        while lo <= hi {
            let mid = lo + (hi-lo)/2
            if array[mid] > number {
                hi = mid-1
            } else {
                lo = mid+1
            }
        }
        return lo
    }
    
}
