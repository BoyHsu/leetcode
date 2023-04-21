//
//  main.swift
//  617. Merge Two Binary Trees
//
//  Created by ada_PC007 on 2017/8/7.
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
    func mergeTrees(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
        if t1 == nil && t2 == nil {
            return nil
        }
        if t1 == nil {
            return t2
        }
        if t2 == nil {
            return t1
        }
        
        let root = TreeNode((t1?.val ?? 0) + (t2?.val ?? 0))
        root.left = mergeTrees(t1?.left, t2?.left)
        root.right = mergeTrees(t1?.right, t2?.right)
        
        return root
    }
}

func buildTree(_ nums: [Int]) -> TreeNode? {
    if nums.isEmpty {
        return nil
    }
    let root = TreeNode(nums.first!)
    var queue = [root]
    
    var idx = 0
    func getValue(_ node: inout TreeNode?, index: inout Int) {
        idx += 1
        if idx >= nums.count {
            return
        }
        if nums[idx] != 0 {
            node = TreeNode(nums[idx])
            queue.append(node!)
        }
    }
    while idx < nums.count && !queue.isEmpty {
        for _ in 0..<queue.count {
            let node = queue.remove(at: 0)
            getValue(&node.left, index: &idx)
            getValue(&node.right, index: &idx)
        }
    }
    return root
}

func traverse(_ root: TreeNode?) {
    if root == nil {
        print("nil")
        return
    }
    var str = ""
    var queue:[Any] = [root!]
    
    while !queue.isEmpty {
        for _ in 0..<queue.count {
            let node = queue.remove(at: 0)
            if node is NSNull {
                str.append("null")
            } else {
                let node = node as! TreeNode
                str.append(String(describing: node.val))
                if node.left != nil {
                    queue.append(node.left!)
                } else {
                    queue.append(NSNull())
                }
                if node.right != nil {
                    queue.append(node.right!)
                } else {
                    queue.append(NSNull())
                }
            }
            
            str.append("\t")
        }
        str.append("\n")
    }
    print(str)
}

var num1 = [1,3,2,5], num2 = [2,1,3,0,4,0,7]

let t1 = buildTree(num1), t2 = buildTree(num2)

traverse(Solution().mergeTrees(t1, t2))






