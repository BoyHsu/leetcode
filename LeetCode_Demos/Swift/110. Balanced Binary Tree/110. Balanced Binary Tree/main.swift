//
//  main.swift
//  110. Balanced Binary Tree
//
//  Created by ada_PC007 on 2017/8/23.
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
    func isBalanced(_ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        }
        let balance = stature(root?.left) - stature(root?.right)
        
        if  -2 < balance && balance < 2 {
            return isBalanced(root?.left) && isBalanced(root?.right)
        }
        return false
    }
    
    func stature(_ node: TreeNode?) -> Int {
        if node == nil {
            return 0
        }
        return max(stature(node?.left), stature(node?.right)) + 1
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

func traverseByDepth(_ root: TreeNode?) {
    if root == nil {
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
                str += "\(node.val) "
                
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
                notAllNull = notAllNull || (node.right != nil || node.left != nil)
            }
            str += "\t"
        }
        str += "\n"
    }
    print(str)
}

//let root = buildTree([1,2,2,3,3,0,0,4,4])
let root = buildTree([1,2,3,4,5,0,6,7,0,0,0,0,8])

traverseByDepth(root)
print(Solution().isBalanced(root))
		
