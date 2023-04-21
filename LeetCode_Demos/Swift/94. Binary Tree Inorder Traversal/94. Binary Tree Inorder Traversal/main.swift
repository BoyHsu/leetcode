//
//  main.swift
//  94. Binary Tree Inorder Traversal
//
//  Created by ada_PC007 on 2017/8/24.
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
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        var s = [TreeNode](), res = [Int]()
        var x = root
        
        while true {
            while x != nil {
                s.append(x!)
                x = x?.left
            }
            if s.isEmpty {
                break
            }
            
            x = s.popLast()
            res.append((x?.val)!)
            x = x?.right
        }
        return res
    }
}

class Solution1 {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var res = [Int]()
        
        func traverse(_ node: TreeNode?) {
            traverse(node?.left)
            res.append((node?.val)!)
            traverse(node?.right)
        }
        
        traverse(root)
        
        return res
    }
}

