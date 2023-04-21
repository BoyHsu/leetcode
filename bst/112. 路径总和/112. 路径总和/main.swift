//
//  main.swift
//  112. 路径总和
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
    var targetSum = 0
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        guard let root = root else { return false }
        self.targetSum = targetSum
        return _hasPathSum(root, 0)
    }
    
    func _hasPathSum(_ node: TreeNode, _ sum: Int) -> Bool {
        if node.left == nil && node.right == nil {
            return sum + node.val == targetSum
        }
        let sum = sum + node.val
        if let l = node.left, _hasPathSum(l, sum) {
            return true
        }
        
        if let r = node.right, _hasPathSum(r, sum) {
            return true
        }
        
        return false
    }
}

