//
//  main.swift
//  450. Delete Node in a BST
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
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        var u: TreeNode?, _hot: TreeNode?
        
        func searchIn(_ node: TreeNode?, _ target: Int) -> TreeNode? {
            if node == nil || (node?.val)! == target {
                return node
            }
            _hot = node
            if (node?.val)! < target {
                return searchIn(node?.right, target)
            } else {
                return searchIn(node?.left, target)
            }
        }
        
        let node = searchIn(root, key)
        if node == nil {
            return root
        }
        
        if _hot == nil {
            if root?.left == nil && root?.right == nil {
                return nil
            }
        }
        
        var nodeIsLC = _hot?.left?.val == node?.val
        
        if node?.left == nil {
            u = node?.right
        } else if node?.right == nil {
            u = node?.left
        } else {
            _hot = node
            u = node?.right
            
            while u?.left != nil {
                _hot = u
                u = u?.left
                nodeIsLC = true
            }
            node?.val = (u?.val)!
            u = u?.right
        }
        
        if _hot != nil {
            if nodeIsLC {
                _hot?.left = u
            } else {
                _hot?.right = u
            }
            return root
        } else {
            return u
        }
        
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
                str += "\(node.val) "
                
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
                
                notAllNull = notAllNull || (node.left != nil || node.right != nil)
            }
            str += "\t"
        }
        str += "\n"
    }
    print(str)
}

let root = buildTree([2,1])
traverse(root)
traverse(Solution().deleteNode(root, 1))
		
