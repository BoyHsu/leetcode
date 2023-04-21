//
//  main.swift
//  102. Binary Tree Level Order Traversal
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
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        if root == nil {
            return []
        }
        var queue = [root!], res = [[Int]]()
        
        while !queue.isEmpty {
            var vals = [Int]()
            
            for _ in 0..<queue.count {
                let node = queue.remove(at: 0)
                
                vals.append(node.val)
                if node.left != nil {
                    queue.append(node.left!)
                }
                if node.right != nil {
                    queue.append(node.right!)
                }
            }
            res.append(vals)
        }
        return res
    }
}



