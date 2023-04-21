//
//  main.swift
//  101. 对称二叉树
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
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return _isSymmetric(root?.left, root?.right)
    }
    
    func _isSymmetric(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
        if left == nil || right == nil {
            return left === right
        }
        
        if left?.val != right?.val {
            return false
        }
        
        return _isSymmetric(left?.left, right?.right) && _isSymmetric(left?.right, right?.left)
    }
}

let a: TreeNode? = nil
let b: TreeNode? = nil
print(a === b)
