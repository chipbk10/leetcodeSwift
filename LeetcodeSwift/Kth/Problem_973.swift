//
//  Problem_973.swift
//  LeetcodeSwift
//
//  Created by Hieu Luong on 30/12/2021.
//

import Foundation
import Darwin

final class Problem_973: ProblemProtocol {
    
    static func run() {
        let problem = Problem_973()
        let points = [[-95,76],[17,7],[-55,-58],[53,20],[-69,-8],[-57,87],[-2,-42],[-10,-87],[-36,-57],[97,-39],[97,49]]
        let k = 5
        let answer = problem.kClosest(points, k)
        print(answer)
    }
     
    // Solutions: https://leetcode.com/problems/k-closest-points-to-origin/solution/
    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        
        return binary_approach(points, k)
//        return quickSelect_approach(points, k)
    }
    
    // Time Complexity: average O(2N), worst case O(N^2)
    // Space Complexity: O(N)
    private func binary_approach(_ points: [[Int]], _ k: Int) -> [[Int]] {
        
        var k = k
        var remaining = [Int]()
        var lo = Double.greatestFiniteMagnitude, hi: Double = -1
        for (index, point) in points.enumerated() {
            let d = distance(point)
            lo = min(lo, d)
            hi = max(hi, d)
            remaining.append(index)
        }
        
        var answer = [[Int]]()
        while k > 0 {
            
            let mid = lo + (hi-lo)/2
            var closer = [Int]()
            var closer_lo = Double.greatestFiniteMagnitude, closer_hi: Double = -1
            
            var further = [Int]()
            var further_lo = Double.greatestFiniteMagnitude, further_hi: Double = -1
            
            for i in remaining {
                let d = distance(points[i])
                if d <= mid {
                    closer.append(i)
                    closer_lo = min(closer_lo, d)
                    closer_hi = max(closer_hi, d)
                } else {
                    further.append(i)
                    further_lo = min(further_lo, d)
                    further_hi = max(further_hi, d)
                }
            }
            
            if closer.count <= k {
                k -= closer.count
                for j in closer {
                    answer.append(points[j])
                }
                remaining = further
                lo = further_lo
                hi = further_hi
            } else {
                remaining = closer
                lo = closer_lo
                hi = closer_hi
            }
        }
                        
        return answer
    }
    
    // Time Complexity: average O(2N), worst case O(N^2)
    // Space Complexity: O(N)
    private func quickSelect_approach(_ points: [[Int]], _ k: Int) -> [[Int]] {
        
        var points = points
        var answer = [[Int]]()
        
        var lo = 0, hi = points.count-1
        var pivotIndex = points.count
        
        while pivotIndex != k {
            pivotIndex = quickSelect(&points, lo, hi)
            if pivotIndex > k       { hi = pivotIndex-1 }
            else if pivotIndex < k  { lo = pivotIndex }
        }
        
        for i in 0..<k { answer.append(points[i]) }
        return answer
    }
    
    // MARK: Helpers
    
    private func quickSelect(_ points: inout [[Int]], _ lo: Int, _ hi: Int) -> Int {
                        
        let pivotIndex = hi
        let pivotValue = squareDistance(points[pivotIndex])
        
        var lo = lo, hi = hi
        while lo < hi {
            if squareDistance(points[lo]) >= pivotValue {
                swap(&points, lo, hi)
                hi -= 1
            } else {
                lo += 1
            }
        }
        
        if squareDistance(points[lo]) < pivotValue { lo += 1 }
        return lo
    }
    
    func distance(_ point: [Int]) -> Double {
        return sqrt(Double(squareDistance(point)))
    }
    
    private func squareDistance(_ point: [Int]) -> Int {
        let x = point[0], y = point[1]
        return x*x + y*y
    }
    
    private func swap(_ array: inout [[Int]], _ i: Int, _ j: Int) {
        let tmp = array[i]
        array[i] = array[j]
        array[j] = tmp
    }
}
