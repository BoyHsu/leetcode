//
//  main.swift
//  98. Validate Binary Search Tree
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
    func isValidBST(_ root: TreeNode?) -> Bool {
        var s = [TreeNode]()
        var last = Int.min
        var x = root
        
        while true {
            while x != nil {
                s.append(x!)
                x = x?.left
            }
            if s.isEmpty {
                break
            }
            
            x = s.popLast()
            if last > (x?.val)! {
                return false
            }
            last = (x?.val)!
            x = x?.right
        }
        return true
    }
}

class Solution1 {
    var last = Int.min
    
    func isValidBST(_ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        }
        
        if !isValidBST(root?.left) {
            return false
        }
        if (root?.val)! < last {
            return false
        }
        last = (root?.val)!
        if !isValidBST(root?.left) {
            return false
        }
        return true
    }
}
