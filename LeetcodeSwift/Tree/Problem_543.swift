//
//  Problem_543.swift
//  LeetcodeSwift
//
//  Created by Hieu Luong on 20/12/2021.
//

class Problem_543: ProblemProtocol {
    
    static func run() {
        let problem = Problem_543()
        let root = TreeNode<Int>(1)
        
        let left = TreeNode<Int>(2)
        left.left = TreeNode<Int>(4)
        left.right = TreeNode<Int>(5)
        
        root.left = left
        
        root.right = TreeNode<Int>(3)
        let answer = problem.diameterOfBinaryTree(root)
        print("answer = \(answer)")
    }
    
    func diameterOfBinaryTree(_ root: TreeNode<Int>?) -> Int {
        let (max, _) = findMax(root)
        return max-1
    }
        
    // Time Complexity: O(N), because in our recursion function `findMax`, we only visit (enter & exit) each node once.
    // We know this because each node is entered from its parent, and in a tree, nodes only have one parent.
    
    // Space Complexity: O(N). The space complexity depends on the size of our implicit call stack during our DFS, which relates to the height of the tree.
    // If the tree is balanced, it'd be O(logN)
    // In the worst case, the tree is skewed so the height of the tree is O(N)
    private func findMax(_ root: TreeNode<Int>?) -> (Int, Int) {
        guard let root = root else { return (0, 0) }
        let (maxLeft, maxEndLeft) = findMax(root.left)
        let (maxRight, maxEndRight) = findMax(root.right)
        
        let maxEndRoot = max(maxEndLeft, maxEndRight) + 1
        var maxSoFar = max(maxLeft, maxRight)
        maxSoFar = max(maxSoFar, maxEndLeft + maxEndRight + 1)
        maxSoFar = max(maxSoFar, maxEndRoot)
        
        return (maxSoFar, maxEndRoot)
    }
    
}
