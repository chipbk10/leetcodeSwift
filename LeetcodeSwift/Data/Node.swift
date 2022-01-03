//
//  Node.swift
//  LeetcodeSwift
//
//  Created by Hieu Luong on 02/01/2022.
//

class Node<T> {
    var value: T
    var next: Node?
    init(_ value: T) {
        self.value = value
    }
}

class DoubleLinkedNode<T> {
    var value: T
    var prev: DoubleLinkedNode?
    var next: DoubleLinkedNode?
    init(_ value: T) {
        self.value = value
    }
}

struct DoubleLinkedList<T> {
    
    private var head: DoubleLinkedNode<T>?
    private var tail: DoubleLinkedNode<T>?
    
    mutating func remove(node: DoubleLinkedNode<T>) -> DoubleLinkedNode<T> {
                                
        let prevNode = node.prev
        let nextNode = node.next
        
        if prevNode == nil {
            head = nextNode
        }
        
        if nextNode == nil {
            tail = prevNode
        }
        
        prevNode?.next = nextNode
        nextNode?.prev = prevNode
        
        node.prev = nil
        node.next = nil
                
        return node
    }
    
    mutating func removeLast() -> DoubleLinkedNode<T>? {
        guard let tail = tail else { return nil }
        return remove(node: tail)
    }
    
    // insert a node to the head position
    mutating func insert(node: DoubleLinkedNode<T>) {
        node.next = head
        head?.prev = node
        head = node
        if tail == nil { tail = head }
    }
    
    mutating func updateRecentUsed(node: DoubleLinkedNode<T>) {
        let removedNode = remove(node: node)
        insert(node: removedNode)
    }
    
    func printList() {
        var s = ""
        var node = head
        while node != nil {
            s += " -> \(node!.value)"
            node = node?.next
        }
        print("DoubleLinkedList: \(s)")
    }
}
