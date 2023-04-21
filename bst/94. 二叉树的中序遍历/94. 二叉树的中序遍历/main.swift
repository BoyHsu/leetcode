//
//  main.swift
//  94. 二叉树的中序遍历
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
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var vals = [Int]()
        var stack = [TreeNode]()
        
        var node: TreeNode? = root
        while true {
            while node != nil {
                stack.append(node!)
                node = node?.left
            }
            if stack.isEmpty {
                break
            }
            let top = stack.removeLast()
            vals.append(top.val)
            node = top.right
        }
        
        return vals
    }
}

