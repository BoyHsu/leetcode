//
//  main.swift
//  144. Binary Tree Preorder Traversal
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
    
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        var res = [Int]()
        
        func traverse(_ node: TreeNode?) {
            if node == nil {return}
            res.append((node?.val)!)
            traverse(node?.left)
            traverse(node?.right)
        }
        
        traverse(root)
        return res
    }
}

class Solution1 {
    
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        var res = [Int](), s = [TreeNode]()
        var x = root
        
        while true {
            while x != nil {
                res.append((x?.val)!)
                if x?.right != nil {
                    s.append((x?.right!)!)
                }
                x = x?.left
            }
            if s.isEmpty {
                break
            }
            x = s.popLast()
        }
        
        return res
    }
}
