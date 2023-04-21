//
//  main.swift
//  653. 两数之和 IV - 输入二叉搜索树
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


class Solution {
    
    var set = Set<Int>()
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
        guard let root = root else { return false }
        
        if set.contains(k-root.val) {
            return true
        }
        set.insert(root.val)
        
        return findTarget(root.left, k) || findTarget(root.right, k)
    }
}

