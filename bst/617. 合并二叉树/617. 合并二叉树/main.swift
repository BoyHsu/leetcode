//
//  main.swift
//  617. 合并二叉树
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
    func mergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
        if root1 == nil {
            return root2
        } else if root2 == nil {
            return root1
        }
        
        let res: TreeNode
        
        if let root1 = root1 {
            res = root1
            root1.val += (root2?.val ?? 0)
        } else {
            res = TreeNode(root2?.val ?? 0)
        }
        
        res.left = mergeTrees(root1?.left, root2?.left)
        res.right = mergeTrees(root1?.right, root2?.right)
        
        return res
    }
//    func mergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
//        if root1 == nil {
//            return root2
//        } else if root2 == nil {
//            return root1
//        }
//
//        var nodes1 = [root1!]
//        var nodes2 = [root2]
//        var idx1 = 0, idx2 = 0
//
//        while idx1 < nodes1.count && idx2 < nodes2.count {
//            let node1 = nodes1[idx1]
//            let node2 = nodes2[idx2]
//            idx1 += 1
//            idx2 += 1
//
//            node1.val += (node2?.val ?? 0)
//
//            if let l = node1.left {
//                nodes1.append(l)
//                nodes2.append(node2?.left)
//            } else if let l2 = node2?.left {
//                let l = TreeNode(0)
//                node1.left = l
//                nodes1.append(l)
//                nodes2.append(l2)
//            }
//
//            if let r = node1.right {
//                nodes1.append(r)
//                nodes2.append(node2?.right)
//            } else if let r2 = node2?.right {
//                let r = TreeNode(0)
//                node1.right = r
//                nodes1.append(r)
//                nodes2.append(r2)
//            }
//        }
//
//        return root1
//    }
//    func mergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
//        if root1 == nil {
//            return root2
//        } else if root2 == nil {
//            return root1
//        }
//
//        var nodes1 = [root1!]
//        var nodes2 = [root2]
//
//        while !nodes1.isEmpty && !nodes2.isEmpty {
//            let node1 = nodes1.removeFirst()
//            let node2 = nodes2.removeFirst()
//
//            node1.val += (node2?.val ?? 0)
//
//            if let l = node1.left {
//                nodes1.append(l)
//                nodes2.append(node2?.left)
//            } else if let l2 = node2?.left {
//                let l = TreeNode(0)
//                node1.left = l
//                nodes1.append(l)
//                nodes2.append(l2)
//            }
//
//            if let r = node1.right {
//                nodes1.append(r)
//                nodes2.append(node2?.right)
//            } else if let r2 = node2?.right {
//                let r = TreeNode(0)
//                node1.right = r
//                nodes1.append(r)
//                nodes2.append(r2)
//            }
//        }
//
//        return root1
//    }
}

