//
//  main.swift
//  101. Symmetric Tree
//
//  Created by ada_PC007 on 2017/8/1.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation


//Definition for a binary tree node.
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
    func isSymmetric(_ root: TreeNode?) -> Bool {
        var queue = [TreeNode]()
        if root != nil {
            queue.append(root!)
        }
        
        while !queue.isEmpty {
            for _ in 0..<queue.count {
                let node = queue.remove(at: 0)
                queue.append(node.left ?? TreeNode(Int.min))
                queue.append(node.right ?? TreeNode(Int.min))
            }
            var lo = 0, hi = queue.count - 1
            while lo < hi {
                if queue[lo].val != queue[hi].val {
                    return false
                }
                lo += 1
                hi -= 1
            }
            var i = 0
            while i < queue.count {
                let node = queue[i]
                if node.val == Int.min {
                    queue.remove(at: i)
                    i -= 1
                }
                i += 1
            }
        }
        return true
    }
}

class Solution1 {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        var queue = [Any]()
        if root != nil {
            queue.append(root!)
        }
        
        while !queue.isEmpty {
            for _ in 0..<queue.count {
                let node = queue.remove(at: 0) as! TreeNode
                queue.append((node.left == nil ? node.left! : NSNull()) as Any)
                queue.append((node.right == nil ? node.right! : NSNull()) as Any)
            }
            var lo = 0, hi = queue.count - 1
            while lo < hi {
                if (queue[lo] as! TreeNode).val != (queue[hi] as! TreeNode).val {
                    return false
                }
                lo += 1
                hi -= 1
                
            }
            
            var i = 0
            while i < queue.count {
                let node = queue[i]
                if node is NSNull {
                    queue.remove(at: i)
                    i -= 1
                }
                i += 1
            }
        }
        return true
    }
}

