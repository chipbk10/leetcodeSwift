//
//  Problem_380.swift
//  LeetcodeSwift
//
//  Created by Hieu Luong on 07/01/2022.
//

final class Problem_380: ProblemProtocol {
    
    static func run() {
        let set = RandomizedSet()
        print(set.insert(1))
        print(set.remove(2))
        print(set.insert(2))
        print(set.getRandom())
        print(set.remove(1))
        print(set.getRandom())
    }
            
    class RandomizedSet {

        private var nums = [Int]()
        private var dict = [Int:Int]() // map a value to its index in the array nums
        
        init() {
        }
        
        func insert(_ val: Int) -> Bool {
            guard dict[val] == nil else { return false }
            nums.append(val)
            dict[val] = nums.count-1
            return true
        }
        
        func remove(_ val: Int) -> Bool {
            guard let index = dict[val] else { return false }
            let lastIndex = nums.count-1
            
            // replace the value of the last index with the value of the current index
            if index < lastIndex {
                let lastValue = nums[lastIndex]
                dict[lastValue] = index
                nums[index] = lastValue
            }
            
            dict[val] = nil
            nums.removeLast()
            return true
        }
        
        func getRandom() -> Int {
            let randomIndex = Int.random(in: 0..<nums.count)
            return nums[randomIndex]
        }
    }
    
}
