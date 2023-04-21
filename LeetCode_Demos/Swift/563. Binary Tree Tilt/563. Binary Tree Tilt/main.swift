//
//  main.swift
//  563. Binary Tree Tilt
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
    var tilt = 0
    
    func findTilt(_ root: TreeNode?) -> Int {
        _ = treeSum(root)
        return tilt
    }
    
    func treeSum(_ node: TreeNode?) -> Int {
        if node == nil {
            return 0
        }
        let left = treeSum(node?.left)
        let right = treeSum(node?.right)
        
        tilt += abs(left-right)
        
        return (node?.val)! + left + right
    }
}

func buildTree(_ nums: [Int]) -> TreeNode? {
    if nums.isEmpty {
        return nil
    }
    
    let root = TreeNode(nums[0])
    var queue = [root]
    var idx = 0
    
    func getValue(_ node: inout TreeNode?) {
        idx += 1
        if idx < nums.count {
            if nums[idx] != 0 {
                node = TreeNode(nums[idx])
                queue.append(node!)
            }
        }
    }
    
    while !queue.isEmpty && idx < nums.count {
        for _ in 0..<queue.count {
            let node = queue.remove(at: 0)
            getValue(&node.left)
            getValue(&node.right)
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
    var queue: [Any] = [root!]
    var notAllNull = true
    
    while !queue.isEmpty && notAllNull {
        notAllNull = false
        for _ in 0..<queue.count {
            let node = queue.remove(at: 0)
            
            if node is NSNull {
                str += "nil"
            } else {
                let node = node as! TreeNode
                
                str += "\(node.val)"
                if node.left == nil {
                    queue.append(NSNull())
                } else {
                    queue.append(node.left!)
                }
                if node.right == nil {
                    queue.append(NSNull())
                } else {
                    queue.append(node.right!)
                }
            }
            str += " \t"
        }
        str += "\n"
    }
    print(str)
}

let root = buildTree([1,2,3,5])
traverse(root)
print(Solution().findTilt(root))
