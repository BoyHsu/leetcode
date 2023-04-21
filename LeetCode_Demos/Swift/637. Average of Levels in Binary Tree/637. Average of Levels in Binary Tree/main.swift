//
//  main.swift
//  637. Average of Levels in Binary Tree
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
    func averageOfLevels(_ root: TreeNode?) -> [Double] {
        if root == nil {
            return []
        }
        var queue = [root], res = [Double]()
        
        while !queue.isEmpty {
            var sum = Double(0), count = queue.count
            for _ in 0..<count {
                let node = queue.remove(at: 0)
                sum += Double((node?.val)!)
                
                if node?.left != nil {
                    queue.append(node?.left!)
                }
                if node?.right != nil {
                    queue.append(node?.right!)
                }
            }
            res.append(sum/Double(count))
        }
        return res
    }
}

func buildTree(_ nums: [Int]) -> TreeNode? {
    if nums.isEmpty {
        return nil
    }
    var root = TreeNode(nums.first!)
    var queue = [root]
    var idx = 0
    
    func getValue(_ node: inout TreeNode?) {
        idx += 1
        if idx >= nums.count {
            return
        }
        node = TreeNode(nums[idx])
        queue.append(node!)
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
    
    var queue: [Any] = [root!]
    var str = ""
    
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

let t1 = buildTree([3,9,20,15,7])
print(Solution().averageOfLevels(t1))

print("")
