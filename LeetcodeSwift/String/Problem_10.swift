//
//  Problem_10.swift
//  LeetcodeSwift
//
//  Created by Hieu Luong on 31/12/2021.
//

final class Problem_10: ProblemProtocol {
    
    static func run() {
        let problem = Problem_10()
//        let s = "baaa", p = "c*ba.*"
//        let s = "aa", p = "a*"
//        let s = "a", p = "aa"
//        let s = "ab", p = ".*"
//        let s = "mississippi", p = "mis*is*p*."
        let s = "a", p = "ab*"
//        let s = "ab", p = ".*c"
        let answer = problem.isMatch(s, p)
        print(answer)
    }
        
    func isMatch(_ s: String, _ p: String) -> Bool {
        return dfs_approach(s, p)
    }
    
    private func dp_approach(_ s: String, _ p: String) -> Bool {
        var dp = [[Bool]](repeating: [Bool](repeating: false, count: p.count+1), count: s.count+1)
        // todo ...
        return dp[0][0]
    }
    
    private func dfs_approach(_ s: String, _ p: String) -> Bool {
        var memo = [[Bool?]](repeating: [Bool?](repeating: nil, count: p.count+1), count: s.count+1)
//        return dfs(Array(s), 0, Array(p), 0, &memo)
        return dfs_improved(Array(s), 0, Array(p), 0, &memo)
    }
    
    private func dfs_improved(_ cs: [Character], _ index_s: Int, _ cp: [Character], _ index_p: Int, _ memo: inout [[Bool?]]) -> Bool {
                
        if index_p >= cp.count { return index_s >= cs.count }
        if let res = memo[index_s][index_p] { return res }
        
        var res: Bool = false
        
        let firstMatch = (index_s < cs.count) && ( (cs[index_s] == cp[index_p]) || (cp[index_p] == ".") )
        let secondMatch = (index_p+1 < cp.count) && cp[index_p+1] == "*"
        
        if secondMatch {
            res = firstMatch ?
                    // "a###" = "a*##" or "a###" = ".*###"
                    ( dfs_improved(cs, index_s, cp, index_p+2, &memo) ||            // "a###" = "###"
                      dfs_improved(cs, index_s+1, cp, index_p, &memo) ||            // "###" = "a###" or "###" = ".*###"
                      dfs_improved(cs, index_s+1, cp, index_p+2, &memo)):           // "###" = "###"
                    // "a###" = "b*##"
                    dfs_improved(cs, index_s, cp, index_p+2, &memo)                 // "a###" = "###"
        } else {
            res = firstMatch ?
                    // "a###" = "a###" or "a###" = ".###"
                    dfs_improved(cs, index_s+1, cp, index_p+1, &memo):              // "###" = "###"
                    // "a###" = "b###"
                    false
        }
        
        memo[index_s][index_p] = res
        return res
    }
    
    private func dfs(_ cs: [Character], _ index_s: Int, _ cp: [Character], _ index_p: Int, _ memo: inout [[Bool?]]) -> Bool {
                
        if let res = memo[index_s][index_p] { return res }
         
        var res: Bool = false
        if index_s >= cs.count && index_p >= cp.count {
            res = true
        } else if index_p >= cp.count {
            res = false
        } else if index_s >= cs.count {
            let nextIndex_p = index_p+1
            if nextIndex_p >= cp.count {    // "" = "b"
                res = false
            } else {
                let nextChar_p = cp[nextIndex_p]
                if nextChar_p == "*" {      // "" = "b*"
                    res = dfs(cs, index_s, cp, index_p+2, &memo)      // "" = ""
                } else {                    // "" = "b?"
                    res = false
                }
            }
        } else {
            let char_s = cs[index_s], char_p = cp[index_p]
            
            if char_s == char_p {
                let nextIndex_p = index_p+1
                if nextIndex_p >= cp.count {    // "a###" = "a"
                    res = dfs(cs, index_s+1, cp, index_p+1, &memo)
                } else {
                    let nextChar_p = cp[nextIndex_p]
                    if nextChar_p == "*" {      // "a###" = "a*###"
                        res =   dfs(cs, index_s, cp, index_p+2, &memo) ||  //  "a###" = "###"
                                dfs(cs, index_s+1, cp, index_p, &memo) ||  //  "###" = "a*###"
                                dfs(cs, index_s+1, cp, index_p+2, &memo)   //  "###" = "###"
                    } else {                    // "a###" = "ab###"
                        res = dfs(cs, index_s+1, cp, index_p+1, &memo)    //  "###" = "b###"
                    }
                }
            } else {
                if char_p == "." {              // "a###" = ".###"
                    let nextIndex_p = index_p+1
                    if nextIndex_p >= cp.count {                        // "a###" = "."
                        res = dfs(cs, index_s+1, cp, index_p+1, &memo)
                    } else {
                        let nextChar_p = cp[nextIndex_p]
                        if nextChar_p == "*" {                                  // "a###" = ".*###"
                            res =   dfs(cs, index_s, cp, index_p+2, &memo) ||      // "a###" = "###"
                                    dfs(cs, index_s+1, cp, index_p, &memo) ||      // "###" = ".*###"
                                    dfs(cs, index_s+1, cp, index_p+2, &memo)       // "###" = "###"
                        } else {                                        // "a###" = ".b###"
                            res = dfs(cs, index_s+1, cp, index_p+1, &memo)
                        }
                    }
                } else {                        // "a###" = "b###"
                    let nextIndex_p = index_p+1
                    if nextIndex_p >= cp.count {                        // "a###" = "b"
                        res = false
                    } else {
                        let nextChar_p = cp[nextIndex_p]
                        if nextChar_p == "*" {                          // "a###" = "b*###"
                            res =  dfs(cs, index_s, cp, index_p+2, &memo)         // "a###" = "###"
                        } else {                                        // "a###" = "bc###"
                            res = false
                        }
                    }
                }
            }
        }
        
        memo[index_s][index_p] = res
        return res
    }
}
