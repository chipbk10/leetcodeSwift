//
//  Problem_202.swift
//  LeetcodeSwift
//
//  Created by Hieu Luong on 11/01/2022.
//

final class Problem_202: ProblemProtocol {
    
    static func run() {
        let problem = Problem_202()
        let n = 19
        let answer = problem.isHappy(n)
        print(answer)
    }
    
    func isHappy(_ n: Int) -> Bool {
                    
        guard n > 1 else { return true }
                
        var slow = n, fast = next(next(n))
        while true {
            
            if slow == 1 {
                return true
            }
            
            if fast == 1 {
                return true
            }
            
            if slow == fast {
                return false
            }
            
            slow = next(slow)
            fast = next(next(fast))
        }
    }
    
    private func next(_ n: Int) -> Int {
        var remaining = n
        var nextNumber = 0
        while remaining != 0 {
            let num = remaining % 10
            remaining /= 10
            nextNumber += num*num
        }
        return nextNumber
    }
}
