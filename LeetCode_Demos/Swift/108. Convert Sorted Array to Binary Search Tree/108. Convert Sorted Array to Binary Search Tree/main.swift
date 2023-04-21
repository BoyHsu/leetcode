//
//  main.swift
//  108. Convert Sorted Array to Binary Search Tree
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
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        if nums.isEmpty {
            return nil
        }
        return buildBST(nums, 0, nums.count)
    }
    
    func buildBST(_ nums: [Int], _ lo: Int, _ hi: Int) -> TreeNode? {
        print("lo == ", lo, ",hi == ", hi)
        if hi == lo {
            return nil
        }
        let root = TreeNode(nums[(lo+hi)>>1])
        
        if hi - lo > 1 {
            root.left = buildBST(nums, lo, (lo+hi)>>1)
            root.right = buildBST(nums, ((lo+hi)>>1)+1, hi)
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
                str += "nil\t"
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

let root = Solution().sortedArrayToBST(Array(1...10))
traverse(root!)

