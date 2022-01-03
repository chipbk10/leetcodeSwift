//
//  Problem_155.swift
//  LeetcodeSwift
//
//  Created by Hieu Luong on 03/01/2022.
//

final class Problem_155: ProblemProtocol {
    
    static func run() {
        let problem = Problem_155()
        problem.test1()
    }
    
    private func test1() {        
        let stack = MinStack()
        stack.push(1)
        stack.push(4)
        stack.push(0)
        stack.push(1)
        
        print(stack.getMin())
        stack.pop()
        print(stack.getMin())
    }
    
    private class MinStack {
        var array: [(value: Int, min: Int)]
        
        init() {
            array = []
        }
        
        func push(_ val: Int) {
            let (_, minValue) = array.last ?? (value:Int.max, min: Int.max)
            array.append( (value: val, min: min(minValue, val)) )
        }
        
        func pop() {
            array.removeLast()
        }
        
        func top() -> Int {
            array.last!.value
        }
        
        func getMin() -> Int {
            array.last!.min
        }
    }
}
