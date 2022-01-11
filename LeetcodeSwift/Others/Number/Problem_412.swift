//
//  Problem_412.swift
//  LeetcodeSwift
//
//  Created by Hieu Luong on 11/01/2022.
//

final class Problem_142: ProblemProtocol {
    
    static func run() {
        let problem = Problem_142()
        let n = 15
        let answer = problem.fizzBuzz(n)
        print(answer)
    }
    
    func fizzBuzz(_ n: Int) -> [String] {
        var answer = [String]()
        let dict = [3:"Fizz",5:"Buzz"]
        for i in 1...n {
            var str = ""
            dict.keys.forEach {
                if i % $0 == 0 {
                    str += dict[$0]!
                }
            }
            if str.isEmpty { str += String(i) }
            answer.append(str)
        }
        return answer
    }
    
    
    
}
