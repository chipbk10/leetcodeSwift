//
//  String+Extension.swift
//  LeetcodeSwift
//
//  Created by Hieu Luong on 31/12/2021.
//

extension String {
    
    // let cs = Array(s)
    // let minIndex = 2
    // let maxIndex = 7
    // return String(cs[minIndex...maxIndex])
    
    func substring(_ from: Int, _ to: Int) -> String {
        let fromIndex = index(startIndex, offsetBy: from)
        let toIndex = index(startIndex, offsetBy: to)
        let range: ClosedRange<String.Index> = fromIndex...toIndex
        return String(self[range])
    }
}

// "a:xyz:c".split(separator: ":") ===> ["a", "xyz", "c"]
// let num = Int(str) ?? 0

// Character <-> AsciiValue
// let a: Character = "a"
// let value = a.asciiValue! // 65
// let c = Character(UnicodeScalar(65)) // "a"


