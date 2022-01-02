//
//  Problem_139.swift
//  LeetcodeSwift
//
//  Created by Hieu Luong on 01/01/2022.
//

final class Problem_139: ProblemProtocol {
    
    static func run() {
        
        let problem = Problem_139()
        let s = "leetcode", wordDict = ["leet","code"]
//        let s = "applepenapple", wordDict = ["apple","pen"]
//        let s = "catsandog", wordDict = ["cats","dog","sand","and","cat"]
        let answer = problem.wordBreak(s, wordDict)
        print(answer)
    }
    
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        
        var wordSet = Set<String>()
        var maxLenWord = 0, minLenWord = Int.max
        for word in wordDict {
            wordSet.insert(word)
            maxLenWord = max(maxLenWord, word.count)
            minLenWord = min(minLenWord, word.count)
        }
        
        // return dfs_approach(Array(s), wordSet, maxLenWord, minLenWord)
        return dp_approach(Array(s), wordSet, maxLenWord, minLenWord)
    }
    
    // Time Complexity: O(N * (maxLenWord - minLenWord) )
    // Space Complexity: O(N)
    private func dp_approach(_ cs: [Character], _ wordSet: Set<String>, _ maxLenWord: Int, _ minLenWord: Int) -> Bool {
        
        // memo[i] = true if cs[0..<i] can be made from wordDict
        var memo = [Bool](repeating: false, count: cs.count+1)
        memo[0] = true
                                        
        for endIndex in minLenWord-1..<cs.count {
            for len in minLenWord...maxLenWord {
                let startIndex = endIndex-len+1
                if startIndex < 0 { break }
                
                let word = String(cs[startIndex...endIndex])
                if wordSet.contains(word) && memo[startIndex] {
                    memo[endIndex+1] = true
                    break
                }
            }
        }
        
        return memo[cs.count]
    }
    
    private func dfs_approach(_ cs: [Character], _ wordSet: Set<String>, _ maxLenWord: Int, _ minLenWord: Int) -> Bool {
//        return dfs(cs, wordSet, maxLenWord, minLenWord, 0)
        var memo = [Bool?](repeating: nil, count: cs.count)
        return dfs_memo(cs, wordSet, maxLenWord, minLenWord, 0, &memo)
    }
    
    private func dfs_memo(_ cs: [Character], _ wordSet: Set<String>, _ maxLenWord: Int, _ minLenWord: Int, _ startIndex: Int, _ memo: inout [Bool?]) -> Bool {
                        
        let n = cs.count
        guard startIndex < n else { return true }
        
        if let res = memo[startIndex] { return res }
        
        var res: Bool = false
        
        if startIndex + minLenWord > n { return false }
        
        let maxLen = min(n-startIndex, maxLenWord)
        for len in minLenWord...maxLen {
            let endIndex = startIndex + len - 1
            let word = String(cs[startIndex...endIndex])
            if wordSet.contains(word) {
                if dfs_memo(cs, wordSet, maxLenWord, minLenWord, endIndex+1, &memo) {
                    res = true
                    break
                }
            }
        }
                
        memo[startIndex] = res
        return res
    }
    
    private func dfs(_ cs: [Character], _ wordSet: Set<String>, _ maxLenWord: Int, _ minLenWord: Int, _ startIndex: Int) -> Bool {
        
        let n = cs.count
        guard startIndex < n else { return true }
        
        if startIndex + minLenWord > n { return false }
        
        let maxLen = min(n-startIndex, maxLenWord)
        for len in minLenWord...maxLen {
            let endIndex = startIndex + len - 1
            let word = String(cs[startIndex...endIndex])
            if wordSet.contains(word) {
                if dfs(cs, wordSet, maxLenWord, minLenWord, endIndex+1) { return true }
            }
        }
                 
        return false
    }
}
