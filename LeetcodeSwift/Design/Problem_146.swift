//
//  Problem_146.swift
//  LeetcodeSwift
//
//  Created by Hieu Luong on 02/01/2022.
//

final class Problem_146: ProblemProtocol {
    
    static func run() {
        
        let problem = Problem_146()
//        problem.test1()
        problem.test2()
    }
    
    private func test2() {
        let cache = LRUCache(2)
        cache.put(2, 1)
        cache.printCache()
        
        cache.put(2, 2)
        cache.printCache()
        
        var value = cache.get(2)
        print("get key = 2, value = \(value)") // should be 2
        
        cache.put(1, 1)
        cache.printCache()
        
        cache.put(4, 1)
        cache.printCache()
        
        value = cache.get(2)
        print("get key = 2, value = \(value)") // should be -1
    }
    
    private func test1() {
        let cache = LRUCache(2)
        cache.put(1, 1)
        cache.put(2, 2)
        cache.printCache()
        
        var value = cache.get(1)
        print("get key = 1, value = \(value)")
        
        cache.put(3, 3)
        cache.printCache()
        
        value = cache.get(2)
        print("get key = 2, value = \(value)")
        
        cache.put(4, 4)
        cache.printCache()
        
        value = cache.get(1)
        print("get key = 1, value = \(value)")
        
        value = cache.get(3)
        print("get key = 3, value = \(value)")
        
        value = cache.get(4)
        print("get key = 4, value = \(value)")
        
        cache.printCache()
    }
    
    private class LRUCache {
        
        let capacity: Int
        var dict: [Int:DoubleLinkedNode< (Int, Int) >] // key: Node< (key,value) >
        var doubleLinkedList: DoubleLinkedList< (Int, Int) > // (key, value)
        
        init(_ capacity: Int) {
            self.capacity = capacity
            self.dict = [:]
            self.doubleLinkedList = DoubleLinkedList()
        }
        
        func get(_ key: Int) -> Int {
            guard let node = dict[key] else { return -1 }
            doubleLinkedList.updateRecentUsed(node: node)
            return node.value.1
        }
        
        func put(_ key: Int, _ value: Int) {
            if let node = dict[key] {
                node.value = (key, value)
                doubleLinkedList.updateRecentUsed(node: node)
            } else {
                if dict.count == capacity {
                    let deletedNode = doubleLinkedList.removeLast()
                    if let keyDeletedNode = deletedNode?.value.0 {
                        dict[keyDeletedNode] = nil
                    }
                }
                
                let newNode = DoubleLinkedNode( (key,value) )
                dict[key] = newNode
                doubleLinkedList.insert(node: newNode)
            }
        }
        
        func printCache() {
            doubleLinkedList.printList()
        }
    }
}
