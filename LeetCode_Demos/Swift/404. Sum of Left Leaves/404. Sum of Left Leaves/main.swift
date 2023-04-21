//
//  main.swift
//  404. Sum of Left Leaves
//
//  Created by ada_PC007 on 2017/8/8.
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
    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        var s = [TreeNode]()
        var res = 0
        var x: TreeNode? = root
        
        while true {
            var time = 0
            
            while x != nil {
                if x?.right != nil {
                    s.append((x?.right!)!)
                }
                if x?.right == nil && x?.left == nil && time != 0 {
                    res += (x?.val)!
                }
                time += 1
                x = x?.left
            }
            if s.isEmpty {
                break
            }
            x = s.popLast()
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
        if nums[idx] != 0 {
            node = TreeNode(nums[idx])
            queue.append(node!)
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
        print("null")
        return
    }
    var str = ""
    var queue: [Any] = [root!]
    
    while !queue.isEmpty {
        for _ in 0..<queue.count {
            let node = queue.remove(at: 0)
            if node is NSNull {
                str += "0 \t"
            } else {
                let node = node as! TreeNode
                str += "\(node.val) \t"
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
        str += "\n"
    }
    print(str)
}

let root = buildTree([1,2])

print(Solution().sumOfLeftLeaves(root))

