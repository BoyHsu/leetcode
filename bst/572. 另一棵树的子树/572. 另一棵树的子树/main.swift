//
//  main.swift
//  572. 另一棵树的子树
//
//  Created by 徐恩 on 2023/4/3.
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
func rootNode(_ nums: [Int?]) -> TreeNode? {
    if nums.isEmpty {
        return nil
    } else if nums[0] == nil {
        return nil
    }
    
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
        if idxC < nums.count {
            nodes[idxP]?.right = nodes[idxC]
        }
        idxC += 1
        idxP += 1
    }
    return nodes[0]
}

class Solution {
    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        if root == nil { return false }
        if isSameTree(root, subRoot) {
            return true
        }
        
        
        return isSubtree(root?.left, subRoot) || isSubtree(root?.right, subRoot)
    }
    
    func isSameTree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        if root == nil, subRoot == nil {
            return true
        } else if root == nil || subRoot == nil {
            return false
        }
        
        if root!.val != subRoot!.val {
            return false
        }
        
        return isSameTree(root?.left, subRoot?.left) && isSameTree(root?.right, subRoot?.right)
    }
}

/**
 [0,1,2,3,4,5,6,7,8]
 [0,3,2,7,8,5,6]
 
 [1,nil,1,nil,1,nil,1,nil,1,nil,1,nil,1,nil,1,nil,1,nil,1,nil,1,2]
 [1,nil,1,nil,1,nil,1,nil,1,nil,1,2]
 */


let s = Solution()
assert(s.isSubtree(rootNode([1,nil,1,nil,1,nil,1,nil,1,nil,1,nil,1,nil,1,nil,1,nil,1,nil,1,2]), rootNode([1,nil,1,nil,1,nil,1,nil,1,nil,1,2])) == true)
print("done")
