//
//  Problem_5.swift
//  LeetcodeSwift
//
//  Created by Hieu Luong on 31/12/2021.
//

final class Problem_5: ProblemProtocol {
    
    static func run() {
        let problem = Problem_5()
//        let s = "babad"
        let s = "cbbd"
        let answer = problem.longestPalindrome(s)
        print(answer)
    }
    
    func longestPalindrome(_ s: String) -> String {
//        return memoApproach(s)
        return middlePointApproach(s)
    }
    
    func middlePointApproach(_ s: String) -> String {
        let cs = Array(s)
        var minIndex = -1, maxIndex = -1, maxLen = -1
        let n = cs.count
        
        for curIndex in 0..<n {
            
            var newLen = 1, d = 1
            while curIndex-d >= 0 && curIndex+d < n && cs[curIndex-d] == cs[curIndex+d] {
                d += 1
                newLen += 2
            }
            
            if newLen > maxLen {
                maxLen = newLen
                d -= 1
                minIndex = curIndex - d
                maxIndex = curIndex + d
            }
            
            newLen = 0
            d = 0
            while curIndex-d >= 0 && curIndex+1+d < n && cs[curIndex-d] == cs[curIndex+1+d] {
                d += 1
                newLen += 2
            }
            
            if newLen > maxLen {
                maxLen = newLen
                d -= 1
                minIndex = curIndex-d
                maxIndex = curIndex+1+d
            }
        }
        
        return String(cs[minIndex...maxIndex])
    }
    
    private func memoApproach(_ s: String) -> String {
        let cs = Array(s)
        var n = cs.count
        var memo = [[Bool?]](repeating: [Bool?](repeating: nil, count: n), count: n)
        while n > 0 {
            var lo = 0
            while lo+n-1 < cs.count {
                let hi = lo+n-1
                // if isPalindrome(cs, lo, hi, &memo) {
                if isPalindrome_useStack(cs, lo, hi, &memo) {
                    return String(cs[lo...hi])
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
