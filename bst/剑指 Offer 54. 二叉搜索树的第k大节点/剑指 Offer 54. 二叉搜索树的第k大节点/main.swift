//
//  main.swift
//  剑指 Offer 54. 二叉搜索树的第k大节点
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
    
    func kthLargest(_ root: TreeNode?, _ k: Int) -> Int {
        var stack = [TreeNode]()
        var node = root
        var res = 0
        var i = 0
        while true {
            while node != nil {
                stack.append(node!)
                node = node?.right
            }
            if stack.isEmpty {
                break
            }
            node = stack.popLast()
            i += 1
            if i == k {
                res = node!.val
            }
            node = node?.left
        }
        return res
    }
    
//    func kthLargest(_ root: TreeNode?, _ k: Int) -> Int {
//        var vals = [Int]()
//        var stack = [TreeNode]()
//        var node = root
//        while true {
//            while node != nil {
//                stack.append(node!)
//                node = node?.left
//            }
//            if stack.isEmpty {
//                break
//            }
//            node = stack.popLast()
//            vals.append(node!.val)
//            node = node?.right
//        }
//        return vals[vals.count-k]
//    }
    
//    func invert(_ root: TreeNode?) {
//        if root == nil {
//            return
//        }
//
//        let temp = root?.left
//        root?.left = root?.right
//        root?.right = temp
//
//        invert(root?.left)
//        invert(root?.right)
//    }
    
//    func kthLargest(_ root: TreeNode?, _ k: Int) -> Int {
//        invert(root)
//        var stack = [TreeNode]()
//        var node = root
//        var i = 0
//        var res = -1
//        while true {
//            while node != nil {
//                stack.append(node!)
//                node = node?.left
//            }
//            if stack.isEmpty {
//                break
//            }
//            node = stack.popLast()
//            i += 1
//            if i == k {
//                res = node!.val
//                break
//            }
//            node = node?.right
//        }
//        return res
//    }
}

