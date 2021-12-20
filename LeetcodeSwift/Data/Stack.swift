//
//  Stack.swift
//  LeetcodeSwift
//
//  Created by Hieu Luong on 20/12/2021.
//

struct Stack<T> {
    
    var array: [T] = []
    
    mutating func push(_ element: T) {
        array.append(element)
    }
    
    mutating func pop() -> T {
        array.removeLast()
    }
    
    var isEmpty: Bool {
        array.count == 0
    }
}
