//
//  Problem_236.swift
//  LeetcodeSwift
//
//  Created by Hieu Luong on 20/12/2021.
//

class Problem_236: ProblemProtocol {
    
    static func run() {
        
        let root = TreeNode<Int>(1)
        root.right = TreeNode<Int>(2)                
        
        let p = root
        let q = root.right
        
        let problem = Problem_236()
        
        let answer = problem.lowestCommonAncestor(root, p, q)
        
        if let value = answer?.val {
            print("value = \(value)")
        } else {
            print("nil")
        }
    }
    
    func lowestCommonAncestor(_ root: TreeNode<Int>?, _ p: TreeNode<Int>?, _ q: TreeNode<Int>?) -> TreeNode<Int>? {
//        return dfs(root, p, q)
        return iterative(root, p, q)
    }
    
    // O(n), O(n)
    private func dfs(_ root: TreeNode<Int>?, _ p: TreeNode<Int>?, _ q: TreeNode<Int>?) -> TreeNode<Int>? {
        guard let p = p else { return q }
        guard let q = q else { return q }
        guard let root = root else { return nil }
        
        if root == p || root == q { return root }
        
        let left = dfs(root.left, p, q)
        let right = dfs(root.right, p, q)
        if left == nil { return right }
        if right == nil { return left }
        return root
    }
    
    private func iterative(_ root: TreeNode<Int>?, _ p: TreeNode<Int>?, _ q: TreeNode<Int>?) -> TreeNode<Int>? {
        
        guard let root = root else { return nil }
        guard let p = p else { return q }
        guard let q = q else { return q }
        guard root != p && root != q else { return root }
        
        var parents = [TreeNode<Int>:TreeNode<Int>]()
        
        var stack = Stack<TreeNode<Int>>()
        stack.push(root)
        
        while parents[p] == nil || parents[q] == nil {
            let curNode = stack.pop()
            
            if let nextNode = curNode.left {
                parents[nextNode] = curNode
                stack.push(nextNode)
            }
            
            if let nextNode = curNode.right {
                parents[nextNode] = curNode
                stack.push(nextNode)
            }
        }
        
        var ancestors = Set<TreeNode<Int>>()
        var curNode: TreeNode<Int>? = p
        
        while let unwrapCurNode = curNode {
            ancestors.insert(unwrapCurNode)
            curNode = parents[unwrapCurNode]
        }
        
        curNode = q
        while let unwrapCurNode = curNode, !ancestors.contains(unwrapCurNode) {
            curNode = parents[unwrapCurNode]
        }
        
        return curNode
    }
}
