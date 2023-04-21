//
//  main.swift
//  606. Construct String from Binary Tree
//
//  Created by ada_PC007 on 2017/8/11.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    func tree2str(_ t: TreeNode?) -> String {
        if t == nil {
            return ""
        }
        
        func nodeValInBracket(_ node: TreeNode) -> String {
            var str = ""
            
            if node.right != nil {
                str = nodeValInBracket(node.right!)
            }
            
            if node.left == nil {
                if str.characters.count != 0 {
                   str = "()" + str
                }
            } else {
                str = nodeValInBracket(node.left!) + str
            }
            
            str = "(\(node.val)" + str + ")"
            return str
        }
        var res = nodeValInBracket(t!)
        res.remove(at: res.startIndex)
        res.remove(at: res.index(before: res.endIndex))
        return res
    }
    
}

func buildBinaryTree(_ nums: [Int]) -> TreeNode? {
    if nums.isEmpty {
        return nil
    }
    let root = TreeNode(nums[0])
    var queue = [root]
    var idx = 0
    
    func getValue(_ node: inout TreeNode?) {
        idx += 1
        if idx < nums.count {
            if nums[idx] > 0 {
                node = TreeNode(nums[idx])
                queue.append(node!)
            }
        }
    }
    
    while !queue.isEmpty {
        for _ in 0..<queue.count {
            let node = queue.remove(at: 0)
            
            getValue(&node.left)
            getValue(&node.right)
        }
    }
    return root
}

func traverse(_ root: TreeNode) {
    var queue: [Any] = [root]
    var str = ""
    
    while !queue.isEmpty {
        for _ in 0..<queue.count {
            let node = queue.remove(at: 0)
            
            if node is NSNull {
                str += "nil"
            } else {
                let node = node as! TreeNode
                str += "\(node.val)"
                if node.left == nil {
                    queue.append(NSNull())
                } else {
                    queue.append(node.left!)
                }
                if node.right == nil {
                    queue.append(NSNull())
                } else {
                    queue.append(node.right!)
                }
            }
            str += " \t"
        }
        str += "\n"
    }
    print(str)
}

func preorderTraverse(_ root: TreeNode?) {
    var s = [TreeNode]()
    var str = ""
    var x = root
    
    while true {
        while x != nil {
            str += "\((x?.val)!)"
            if x?.right != nil {
                s.append((x?.right)!)
            }
            x = x?.left
        }
        if s.isEmpty {
            break
        }
        x = s.popLast()
        str += ")"
    }
    print(str)
}

func preorderTraverseII(_ root: TreeNode) -> String {
    var str = "\(root.val)"
    
    if root.left != nil {
        str += "(\(preorderTraverseII(root.left!)))"
    }
    if root.right != nil {
        if root.left == nil {
            str += "()"
        }
        str += "(\(preorderTraverseII(root.right!)))"
    }
    
    return str
}

let root = buildBinaryTree([1,2,3,0,4,0,5])
print(preorderTraverseII(root!))
print(Solution().tree2str(root))
