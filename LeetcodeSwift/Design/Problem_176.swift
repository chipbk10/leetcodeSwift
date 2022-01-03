//
//  Problem_176.swift
//  LeetcodeSwift
//
//  Created by Hieu Luong on 03/01/2022.
//

final class Problem_176: ProblemProtocol {
    
    static func run() {
        let problem = Problem_176()
        problem.test1()
    }
    
    private func test1() {
        let stack = MaxStack()
        stack.push(5)
        stack.push(1)
        stack.push(2)
        stack.push(4)
        
        print(stack.peekMax())
        print(stack.pop())
        print(stack.popMax())
    }
    
    // todo: if we use the approach of problem_155, the time complexity of popMax will be O(N)
    class MaxStack {
        
        init() {
        }
        
        func push(_ x: Int) {
            
        }
        
        func pop() -> Int {
            return 0
        }
        
        func top() -> Int {
            return 0
        }
        
        func peekMax() -> Int {
            return 0
        }
        
        func popMax() -> Int {
            return 0
        }
    }
    
}

