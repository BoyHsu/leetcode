//
//  main.swift
//  114. Flatten Binary Tree to Linked List
//
//  Created by ada_PC007 on 2017/8/25.
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
    func flatten(_ root: TreeNode?) {
        if root == nil {
            return
        }
        flatten(root?.left)
        flatten(root?.right)
        let node = goLongRight(root?.left)
        if node != nil && root?.left?.val != node?.val {
            node?.right = root?.right
            root?.right = root?.left
            root?.left = nil
        }
        
    }
    func goLongRight(_ node: TreeNode?) -> TreeNode? {
        if node == nil || node?.right == nil {
            return node
        }
        return goLongRight(node?.right)
    }
}

