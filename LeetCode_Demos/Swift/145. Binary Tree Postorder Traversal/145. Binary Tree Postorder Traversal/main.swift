//
//  main.swift
//  145. Binary Tree Postorder Traversal
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
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        var s = [root!], res = [Int]()
        var x = root
        
        while !s.isEmpty {
            let top = s.last
            if (top?.left?.val ?? 0) != (x?.val)! && (top?.right?.val ?? 0) != (x?.val)! {
                x = s.last
                while x != nil {
                    if x?.right != nil {
                        s.append((x?.right)!)
                    }
                    if x?.left != nil {
                        s.append((x?.left)!)
                    }
                    if x?.left == nil && x?.right == nil {
                        break
                    }
                    x = s.last
                }
            }
            
            x = s.popLast()
            res.append((x?.val)!)
        }
        
        return res
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
            if nums[idx] > 0 {
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

func traversal(_ root: TreeNode?) {
    if root == nil {
        print("nil ")
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

let root = buildTree([1,4,3,2])
traversal(root)
print(Solution().postorderTraversal(root))
