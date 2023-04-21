//
//  main.swift
//  543. 二叉树的直径
//
//  Created by 徐恩 on 2023/4/2.
//

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    var diameter = Int.min
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        let len = longestPathLength(root!)
        return max(len, diameter)
    }
    
    func longestPathLength(_ node: TreeNode) -> Int {
        if node.left == nil, node.right == nil {
            return 0
        }
        
        var lenL = 0, lenR = 0
        if let l = node.left {
            lenL = longestPathLength(l) + 1
        }
        if let r = node.right {
            lenR = longestPathLength(r) + 1
        }
        
        if lenL + lenR > diameter {
            diameter = lenL + lenR
        }
        return max(lenL, lenR)
    }
}

//[1,2,3,4,5,null,null,6,null,null,7,8]
