//
//  main.swift
//  543_DiameterOfBinaryTree
//
//  Created by ada_PC007 on 2017/4/25.
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
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        let d = max(diameterOfBinaryTree(root?.left), diameterOfBinaryTree(root?.right))
        
        return d == 1 ? 0 : d
    }
}

