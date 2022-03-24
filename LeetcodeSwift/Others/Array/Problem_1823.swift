//
//  Problem_1823.swift
//  LeetcodeSwift
//
//  Created by Hieu Luong on 18/03/2022.
//

final class Problem_1823: ProblemProtocol {
    
    static func run() {
        let n = 6
        let k = 5
        let problem = Problem_1823()
        let result = problem.findTheWinner(n, k)
        print(result)
    }
    
    func findTheWinner(_ n: Int, _ k: Int) -> Int {
            
        var arr = [Int](1...n)
        var curIndex = 0
        
        while curIndex < arr.count-1 {
            for i in 0..<k {
                if i < k-1 { arr.append(arr[curIndex]) }
                curIndex += 1
            }
        }
        
        var tree = [Int:](repeating:[], count: 3)
        
        return arr[curIndex]
    }
}
