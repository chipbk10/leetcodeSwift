//
//  Problem_341.swift
//  LeetcodeSwift
//
//  Created by Hieu Luong on 03/01/2022.
//

final class Problem_341: ProblemProtocol {
    
    static func run() {        
        // still need to read other solutions:
        // using stack, 2 stacks, stack of iterators, using a generator
        // https://leetcode.com/problems/flatten-nested-list-iterator/solution/
    }
                
    class NestedIterator {

        private var curIndex = -1
        private var array: [Int] = []
        
        init(_ nestedList: [NestedInteger]) {
            add(nestedList)
        }
        
        private func add(_ nestedList: [NestedInteger]) {
            for nestedInteger in nestedList {
                if nestedInteger.isInteger() {
                    array.append(nestedInteger.getInteger())
                } else {
                    add(nestedInteger.getList())
                }
            }
        }
        
        func next() -> Int {
            guard hasNext() else {
                fatalError("Array is empty")
            }
            curIndex += 1
            return array[curIndex]
        }
        
        func hasNext() -> Bool {
            curIndex+1 < array.count
        }
    }
    
    
    class NestedInteger {
        // Return true if this NestedInteger holds a single integer, rather than a nested list.
        func isInteger() -> Bool /* simulate */ { true }
    
        // Return the single integer that this NestedInteger holds, if it holds a single integer
        // The result is undefined if this NestedInteger holds a nested list
        func getInteger() -> Int /* simulate */ { 0 }
    
        // Set this NestedInteger to hold a single integer.
        func setInteger(value: Int) /* simulate */ {}
    
        // Set this NestedInteger to hold a nested list and adds a nested integer to it.
        func add(elem: NestedInteger) /* simulate */ {}
    
        // Return the nested list that this NestedInteger holds, if it holds a nested list
        // The result is undefined if this NestedInteger holds a single integer
        func getList() -> [NestedInteger] /* simulate */ { [] }
    }
}
