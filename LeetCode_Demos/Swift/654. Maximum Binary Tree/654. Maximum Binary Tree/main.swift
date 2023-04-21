//
//  main.swift
//  654. Maximum Binary Tree
//
//  Created by ada_PC007 on 2017/8/10.
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
    func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
        if nums.isEmpty {
            return nil
        }
        var idx = 0
        for i in 0..<nums.count {
            if nums[i] > nums[idx] {
                idx = i
            }
        }
        let node = TreeNode(nums[idx])
        node.left = constructMaximumBinaryTree(Array(nums[0..<idx]))
        node.right = constructMaximumBinaryTree(Array(nums[idx+1..<nums.count]))
        return node
    }
}

class Solution1 {
    func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
        if nums.isEmpty {
            return nil
        }
        
        func insertAsSubTree(_ node: TreeNode, _ child: TreeNode) {
            if child.val > (node.right?.val ?? Int.min) {
                child.left = node.right
                node.right = child
                return
            }
            insertAsSubTree(node.right!, child)
        }
        var root = TreeNode(nums[0])
        
        for i in 1..<nums.count {
            if root.val < nums[i] {
                let node = TreeNode(nums[i])
                node.left = root
                root = node
            } else {
                insertAsSubTree(root, TreeNode(nums[i]))
            }
        }

        return root
    }
}

func traverse(_ root: TreeNode) {
    var queue: [Any] = [root]
    var str = ""

    while !queue.isEmpty {
        for _ in 0..<queue.count {
            let node = queue.remove(at: 0)
            if node is NSNull {
                str += "null\t"
            } else {
                let node = node as! TreeNode
                
                str += "\(node.val ) \t"
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
        }
    }
    print(str)
}

let root = Solution1().constructMaximumBinaryTree([3,2,1,6,0,5])

traverse(root!)
