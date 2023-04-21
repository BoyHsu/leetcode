//
//  main.swift
//  100. Same Tree
//
//  Created by ada_PC007 on 2017/8/8.
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
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p != nil && q != nil {
            if p?.val != q?.val {
                return false
            }
            return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
        } else {
            return p == nil && q == nil
        }
    }
}

