//
//  main.swift
//  剑指 Offer 27. 二叉树的镜像
//
//  Created by 徐恩 on 2023/4/2.
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
    func mirrorTree(_ root: TreeNode?) -> TreeNode? {
        if let root = root {
            let temp = root.left
            root.left = root.right
            root.right = temp
            
            _ = mirrorTree(root.left)
            _ = mirrorTree(root.right)
        }
        
        return root
    }
}

