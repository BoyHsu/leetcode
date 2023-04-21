//
//  main.swift
//  257. 二叉树的所有路径
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
    var res = [String]()
    var stack = [TreeNode]()
    
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        
        dfs(root)
        
        return res
    }
    
    func dfs(_ node: TreeNode?) {
        if node == nil {
            return
        }
        
        stack.append(node!)
        
        if node?.left == nil && node?.right == nil {
            var str = String(stack[0].val)
            
            for i in 1..<stack.count {
                let node = stack[i]
                str.append("->")
                str.append(String(node.val))
            }
            
            res.append(str)
        } else {
            dfs(node?.left)
            dfs(node?.right)
        }
        
        stack.removeLast()
    }
    
    
}

func rootNode(_ nums: [Int?]) -> TreeNode? {
    if nums.isEmpty {
        return nil
    } else if nums[0] == nil {
        return nil
    }
    let root = TreeNode(nums[0]!)
    var nodes = [TreeNode?](repeating: nil, count: nums.count)
    
    for i in nums.indices {
        if let num = nums[i] {
            nodes[i] = TreeNode(num)
        }
    }
    
    var idxP = 0, idxC = 1
    while idxC < nums.count {
        nodes[idxP]?.left = nodes[idxC]
        idxC += 1
        nodes[idxP]?.right = nodes[idxC]
        idxC += 1
        idxP += 1
    }
    return nodes[0]
}

let root = rootNode([1,2,3,nil,5])
let s = Solution()
assert(s.binaryTreePaths(root) == ["1->2->5","1->3"])
print("done")
