//
//  Problem_5.swift
//  LeetcodeSwift
//
//  Created by Hieu Luong on 31/12/2021.
//

final class Problem_5: ProblemProtocol {
    
    static func run() {
        let problem = Problem_5()
        let s = "babad"
        let answer = problem.longestPalindrome(s)
        print(answer)
    }
    
    func longestPalindrome(_ s: String) -> String {
        let cs = Array(s)
        var n = cs.count
        var memo = [[Bool?]](repeating: [Bool?](repeating: nil, count: n), count: n)
        while n > 0 {
            var lo = 0
            while lo+n-1 < cs.count {
                let hi = lo+n-1
                // if isPalindrome(cs, lo, hi, &memo) {
                if isPalindrome_useStack(cs, lo, hi, &memo) {
                    return s.substring(lo, hi)
                }
                lo += 1
            }
            n -= 1
        }
        return ""
    }
    
    private func isPalindrome(_ cs: [Character], _ lo: Int, _ hi: Int, _ memo: inout [[Bool?]]) -> Bool {
        if lo > hi { return true }        
        if let res = memo[lo][hi] {
            return res
        }
        if cs[lo] != cs[hi] {
            memo[lo][hi] = false
            return false
        }
        let res = isPalindrome(cs, lo+1, hi-1, &memo)
        memo[lo][hi] = res
        return res
    }
    
    private func isPalindrome_useStack(_ cs: [Character], _ lo: Int, _ hi: Int, _ memo: inout [[Bool?]]) -> Bool {
        var stack = Stack<[Int]>()
        var lo = lo, hi = hi
        while lo <= hi {
            if cs[lo] == cs[hi] { stack.push([lo, hi]) }
            else { break }
            lo += 1
            hi -= 1
        }
        let res = lo > hi
        while !stack.isEmpty {
            let e = stack.pop(), from = e[0], to = e[1]
            memo[from][to] = res
        }
        return res
    }
}
