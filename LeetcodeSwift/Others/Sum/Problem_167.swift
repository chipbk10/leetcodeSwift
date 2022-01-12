//
//  Problem_167.swift
//  LeetcodeSwift
//
//  Created by Hieu Luong on 12/01/2022.
//

final class Problem_167: ProblemProtocol {
    
    static func run() {
        let problem = Problem_167()
        let numbers = [2,7,11,15]
        let target = 9
        let answer = problem.twoSum(numbers, target)
        print(answer)
    }
    
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var lo = 0, hi = numbers.count-1, sum = 0
        while lo < hi {
            sum = numbers[lo] + numbers[hi]
            if sum == target {
                return [lo+1, hi+1]
            }
            if sum < target {
                lo += 1
            } else {
                hi -= 1
            }
        }
        return []
    }
}
