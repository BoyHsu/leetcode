//
//  main.swift
//  543. Diameter of Binary Tree
//
//  Created by ada_PC007 on 2017/7/31.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation


//Definition for a binary tree node.
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
    var res = 0
    
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        recursion(root)
        return res
    }
    
    func recursion(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        if root?.left == nil && root?.right == nil {
            return 1
        }
        
        let left = recursion(root?.left)
        let right = recursion(root?.right);
        res = max(left + right, res)
        
        return max(left, right)+1
    }
}

let root = TreeNode(1)
root.left = TreeNode(2)
root.right = TreeNode(3)

let subl = TreeNode(4)
let subr = TreeNode(5)
root.left?.left = subl
root.left?.right = subr
subl.left = TreeNode(6)
subr.right = TreeNode(7)

print(Solution().diameterOfBinaryTree(root))


