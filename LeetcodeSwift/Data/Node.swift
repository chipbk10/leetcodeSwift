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

class LinkedList<T> {
    
    var first: Node<T>? = nil
    var last: Node<T>? = nil
    
    func addLast(_ value: T) {
        let node = Node(value)
        if let last = last {
            last.next = node
        } else {
            last = node
            first = node
        }
        self.last = self.last?.next
    }
    
    func removeFirst() -> T {
        guard let first = first else { fatalError("Cannot remove first element") }
        self.first = first.next
        if first === last {
            last = nil
        }
        self.first = first.next
        first.next = nil
        return first.value
    }
    
    func offer(_ value: T) {
        addLast(value)
    }
    
    func poll() -> T {
        removeFirst()
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
