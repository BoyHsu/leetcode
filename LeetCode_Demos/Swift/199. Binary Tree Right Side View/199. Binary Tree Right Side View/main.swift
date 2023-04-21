//
//  main.swift
//  199. Binary Tree Right Side View
//
//  Created by ada_PC007 on 2017/8/11.
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
    func rightSideView(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        var res = [(root?.val)!], queue = [root!]
        
        while !queue.isEmpty {
            for _ in 0..<queue.count {
                let node = queue.remove(at: 0)
                
                if node.left != nil {
                    queue.append(node.left!)
                }
                if node.right != nil {
                    queue.append(node.right!)
                }
            }
            
            if !queue.isEmpty {
                res.append((queue.last?.val)!)
            }
        }
        return res
    }
}

func buildTree(_ nums: [Int]) -> TreeNode? {
    if nums.isEmpty {
        return nil
    }
    
    var root = TreeNode(nums[0])
    var queue = [root];
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
        for _  in 0..<queue.count {
            let node = queue.remove(at: 0)
            
            getValue(&node.left)
            getValue(&node.right)
        }
    }
    
    return root
}

func traverse(_ root: TreeNode) {
    var queue: [Any] = [root]
    var str = ""
    
    while !queue.isEmpty {
        for _ in 0..<queue.count {
            let node = queue.remove(at: 0)
            
            if node is NSNull {
                str += "null \t"
            } else {
                let node = node as! TreeNode
                str += "\(node.val) \t"
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
            
        }
        str += "\n"
    }
    print(str)
}

let root = buildTree([1,2,3,0,4,0,5])

print(Solution().rightSideView(root))

