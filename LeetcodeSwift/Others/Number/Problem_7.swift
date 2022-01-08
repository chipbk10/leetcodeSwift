//
//  Problem_7.swift
//  LeetcodeSwift
//
//  Created by Hieu Luong on 08/01/2022.
//

final class Problem_7: ProblemProtocol {
    
    static func run() {
        let problem = Problem_7()
        let x: Int32 = 123
        let answer = problem.reverse(x)
        print(answer)
    }
    
    func reverse(_ x: Int32) -> Int32 {
        
        var answer: Int32 = 0
        var x: Int32 = x
        
        let maxBound = Int32.max/10
        let maxOffset = 7
        
        let minBound = Int32.min/10
        let minOffset = -8
        
        while x != 0 {
            
            if answer > maxBound || answer < minBound {
                return 0
            }
            
            let rev = x % 10
            x /= 10
            
            if answer == maxBound && rev > maxOffset {
                return 0
            }
            
            if answer == minBound && rev < minOffset {
                return 0
            }
            
            answer = answer * 10 + rev
        }
        
        return answer
    }
}
