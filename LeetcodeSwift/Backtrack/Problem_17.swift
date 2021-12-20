//
//  Problem_17.swift
//  LeetcodeSwift
//
//  Created by Hieu Luong on 20/12/2021.
//

class Problem_17: ProblemProtocol {
    
    static func run() {
        let problem = Problem_17()
        let digits = "23"
        let answer = problem.letterCombinations(digits)
        print(answer)
    }
    
    
    func letterCombinations(_ digits: String) -> [String] {
        let map: [[Character]] = [ [], [], ["a","b","c"], ["d","e","f"], ["g","h","i"], ["j","k","l"], ["m","n","o"], ["p","q","r","s"], ["t","u","v"], ["w","x","y","z"]]
        var answer = [String]()
        var temp = [Character]()
        backtrack(Array(digits), map, 0, &temp, &answer)
        return answer
    }
    
    // Time Complexity: O(4^N * N), where N is the length of digits array
    // There are ultimately 4^N combinations of strings generated
    // And for each of those combinations, we have to actually construct the string.
    // Constructing a string of N character would be an O(N) operations.
    // So thus O(4^N * N)
    
    // Space Complexity: O(N), where N is the length of digits array
    // Not counting space used for the output, the extra space we use relative to input size is the space occupied by the recursion call stack.
    // It will only go as deep as the number of digits in the input since whenever we reach that depth, we backtrack.
    private func backtrack(_ digits: [Character], _ map: [[Character]], _ index: Int, _ temp: inout [Character], _ answer: inout [String]) {
        
        guard index < digits.count else {
            if temp.count > 0 { answer.append(String(temp)) } // O(N)
            return
        }
        
        let digit = digits[index]
        let zeroChar: Character = "0"
        let chars = map[Int(digit.asciiValue!)-Int(zeroChar.asciiValue!)]
        
        // O(4^N)
        for char in chars {
            temp.append(char)
            backtrack(digits, map, index+1, &temp, &answer)
            temp.removeLast()
        }
    }
}
