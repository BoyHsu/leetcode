//
//  main.swift
//  145. 二叉树的后序遍历
//
//  Created by 徐恩 on 2023/4/2.
//

import Foundation


public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        var vals = [Int]()
        if let root = root {
            var stack = [root]
            var node: TreeNode? = root
            while !stack.isEmpty {
                let top = stack.last
                if top?.left !== node && top?.right !== node {
                    node = top
                    while node?.left != nil || node?.right != nil  {
                        if let r = node?.right {
                            stack.append(r)
                        }
                        if let l = node?.left {
                            stack.append(l)
                        }
                        
                        node = stack.last!
                    }
                }
                
                node = stack.popLast()
                vals.append(node!.val)
            }
        }
        
        return vals
    }
}

let node3 = TreeNode(3)
let node2 = TreeNode(2, node3, nil)
let node1 = TreeNode(1, nil, node2)

let s = Solution()
assert(s.postorderTraversal(node1) == [3, 2, 1])
print("done")
