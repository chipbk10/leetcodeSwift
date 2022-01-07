//
//  Problem_381.swift
//  LeetcodeSwift
//
//  Created by Hieu Luong on 07/01/2022.
//

final class Problem_381: ProblemProtocol {
    
    static func run() {    
    }
            
    class RandomizedCollection {
            
        private var map = [Int:Set<Int>]()
        private var nums = [Int]()
        
        init() {
        }
        
        func insert(_ val: Int) -> Bool {
            let res = map[val] == nil
            nums.append(val)
            map[val, default: Set<Int>()].insert(nums.count-1)
            return res
        }
        
        func remove(_ curVal: Int) -> Bool {
            
            guard var curSet = map[curVal] else { return false }
            
            let curIndex = curSet.first!
            curSet.remove(curIndex)
            map[curVal] = curSet.isEmpty ? nil : curSet
                
            let lastIndex = nums.count-1
            if curIndex < lastIndex {
                let lastValue = nums[lastIndex]
                var lastSet = map[lastValue]!
                nums[curIndex] = lastValue
                lastSet.remove(lastIndex)
                lastSet.insert(curIndex)
                map[lastValue] = lastSet
            }
            
            nums.removeLast()
            return true
        }
        
        func getRandom() -> Int {
            return nums.randomElement()!
        }
    }
    
}
