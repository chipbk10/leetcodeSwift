//
//  Problem_8.swift
//  LeetcodeSwift
//
//  Created by Hieu Luong on 11/01/2022.
//

final class Problem_8: ProblemProtocol {
    
    static func run() {
        let problem = Problem_8()
        let s = "   -0042   a65 "
        let answer = problem.myAtoi(s)
        print(answer)
    }    
    
    func myAtoi(_ s: String) -> Int {
        return readLeadingWhiteSpace(Array(s), 0)
    }
    
    private func readLeadingWhiteSpace(_ cs: [Character], _ curIndex: Int) -> Int {
        guard curIndex < cs.count else {
            return 0
        }
        
        if cs[curIndex] == " " {
            return readLeadingWhiteSpace(cs, curIndex+1)
        } else {
            return readSign(cs, curIndex)
        }
    }
    
    private func readSign(_ cs: [Character], _ curIndex: Int) -> Int {
        guard curIndex < cs.count else {
            return 0
        }
        if cs[curIndex] == "-" {
            return readDigit(cs, curIndex+1, true, 0)
        } else if cs[curIndex] == "+" {
            return readDigit(cs, curIndex+1, false, 0)
        } else {
            return readDigit(cs, curIndex, false, 0)
        }
    }
    
    private func readDigit(_ cs: [Character], _ curIndex: Int, _ isNegative: Bool, _ curValue: Int) -> Int {
        guard curIndex < cs.count else {
            return isNegative ? -curValue : curValue
        }
        
        let curChar = cs[curIndex]
        if curChar.isNumber {
            let zeroChar: Character = "0"
            let zeroCharAsciiValue = Int(zeroChar.asciiValue!)
            let digit = Int(curChar.asciiValue!) - zeroCharAsciiValue
            
            let realValue = isNegative ? -curValue : curValue
            
            // overflowed
            if realValue > Int32.max/10 || (realValue == Int32.max/10 && digit > 7) {
                return Int(Int32.max)
            }
            
            // underflowed
            if realValue < Int32.min/10 || (realValue == Int32.min/10 && digit > 8) {
                return Int(Int32.min)
            }
            
            return readDigit(cs, curIndex+1, isNegative, curValue*10 + digit)
        } else {
            return isNegative ? -curValue : curValue
        }
    }
    
    
}
