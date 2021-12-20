//
//  Queue.swift
//  LeetcodeSwift
//
//  Created by Hieu Luong on 20/12/2021.
//

struct Queue<T> {
    
    var array: [T] = []
    var head = -1
    
    mutating func offer(_ element: T) {
        array.append(element)
        if head == -1 { head = 0 }
    }
    
    mutating func poll() -> T {
        
        let answer = array[head]
        head += 1
        
        if head == array.count {
            array = []
            head = -1
        } else {
            let percentage = Double(head) / Double(array.count)
            if array.count > 100 && percentage > 0.25 {
                array.removeFirst(head)
                head = 0
            }
        }
                        
        return answer
    }
    
    var isEmpty: Bool {
        head == -1 || head == array.count
    }
    
    var count: Int {
        isEmpty ? 0 : array.count - head
    }
}
