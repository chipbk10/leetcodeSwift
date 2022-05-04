//
//  Character.swift
//  LeetcodeSwift
//
//  Created by Hieu Luong on 22/03/2022.
//

import Foundation

/*
var c: Character = "9"
c.isNumber
c.asciiValue
c.isLetter
c.isUppercase
c.isLowercase
c.uppercased()
c.lowercased()
let num = 97
c = Character(UnicodeScalar(num))
*/

extension Character {    
    func toNumber() -> Int {
        let zero: Character = "0"
        return Int(asciiValue!) - Int(zero.asciiValue!)
    }
}
