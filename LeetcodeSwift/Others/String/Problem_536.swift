//
//  Problem_536.swift
//  LeetcodeSwift
//
//  Created by Hieu Luong on 29/04/2022.
//

final class Problem_536: ProblemProtocol {
    
    static func run() {
        let problem = Problem_536()
        let s = "4(2(3)(1))(6(5))"
        let result = problem.str2tree(s)
    }
    
    func str2tree(_ s: String) -> TreeNode<Int>? {
            
        var stack = Stack<(node:TreeNode<Int>, opens: Int)>()
        var num: Int?, sign = 1
        for c in s {
            switch c {
            case "-": sign = -1
            case "(":
                if let actualNum = num {
                    stack.push((TreeNode(actualNum), opens: 0))
                    num = nil
                    sign = 1
                }
                
            case ")":
                if !stack.isEmpty {
                    let (node, opens) = stack.pop()
                    if opens == 0 {
                        if let actualNum = num {
                            node.left = TreeNode(actualNum)
                            stack.push((node, 1))
                            num = nil
                            sign = 1
                        }
                        
                    } else if opens == 1 {
                        if let actualNum = num {
                            node.right = TreeNode(actualNum)
                            stack.push((node, 2))
                            num = nil
                            sign = 1
                        } else if !stack.isEmpty {
                            let (topNode, topOpens) = stack.pop()
                            if topOpens == 0 {
                                topNode.left = node
                                stack.push((topNode, topOpens+1))
                            } else if topOpens == 1 {
                                topNode.right = node
                                stack.push((topNode, topOpens+1))
                            }
                        }
                    } else {
                        if !stack.isEmpty {
                            let (topNode, topOpens) = stack.pop()
                            if topOpens == 0 {
                                topNode.left = node
                                stack.push((topNode, topOpens+1))
                            } else if topOpens == 1 {
                                topNode.right = node
                                stack.push((topNode, topOpens+1))
                            }
                        }
                    }
                }
            default:
                if let actualNum = num {
                    num = actualNum * 10 + sign * c.toNumber()
                } else {
                    num = c.toNumber()
                }
            }
        }
        
        return stack.peek?.node
    }
    
    
}
