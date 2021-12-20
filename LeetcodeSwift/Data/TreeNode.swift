//
//  TreeNode.swift
//  LeetcodeSwift
//
//  Created by Hieu Luong on 20/12/2021.
//

class TreeNode<T> {
    
    var val: T
    var left: TreeNode?
    var right: TreeNode?
    
    init(_ val: T) {
        self.val = val
    }
    
    init(_ array: [T]) {
        // todo
        self.val = array.first!
    }
}

extension TreeNode: Equatable {
    
    public static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        lhs === rhs
    }
}

extension TreeNode: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}

