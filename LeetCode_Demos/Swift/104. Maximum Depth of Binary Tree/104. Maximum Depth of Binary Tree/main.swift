//
//  main.swift
//  104. Maximum Depth of Binary Tree
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
    func maxDepth(_ root: TreeNode?) -> Int {
        var depth = 0
        var queue = [TreeNode]()
        if root != nil {
            queue.append(root!)
        }
        while !queue.isEmpty {
            depth+=1
            for _ in 0..<queue.count {
                let node = queue.remove(at: 0);
                if node.left != nil {
                    queue.append(node.left!)
                }
                if node.right != nil {
                    queue.append(node.right!)
                }
            }
        }
        return depth
    }
}

class Solution1 {
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        return max(maxDepth(root?.left), maxDepth(root?.right))+1
    }
}

