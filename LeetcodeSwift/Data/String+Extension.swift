//
//  String+Extension.swift
//  LeetcodeSwift
//
//  Created by Hieu Luong on 31/12/2021.
//

extension String {    
    func substring(_ from: Int, _ to: Int) -> String {
        let fromIndex = index(startIndex, offsetBy: from)
        let toIndex = index(startIndex, offsetBy: to)
        let range: ClosedRange<String.Index> = fromIndex...toIndex
        return String(self[range])
    }
}
