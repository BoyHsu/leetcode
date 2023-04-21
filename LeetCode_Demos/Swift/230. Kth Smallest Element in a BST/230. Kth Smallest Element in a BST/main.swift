//
//  main.swift
//  230. Kth Smallest Element in a BST
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
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var s = [root!]
        var idx = 0, res = 0
        var x = root
        
        while true {
            while x != nil {
                s.append(x!)
                x = x?.left
            }
            
            x = s.popLast()
            idx += 1
            if idx == k {
                res = (x?.val)!
                break
            }
            x = x?.right
        }
        return res
    }
}
