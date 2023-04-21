//
//  main.swift
//  671. 二叉树中第二小的节点
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
    func findSecondMinimumValue(_ root: TreeNode?) -> Int {
        guard let root = root else { return -1 }
        if root.left == nil, root.right == nil {
            return -1
        }
        
        var valL = findSecondMinimumValue(root.left)
        var valR = findSecondMinimumValue(root.right)
        
        if valL == -1 || root.val != root.left!.val {
            valL = root.left!.val
        }
        if valR == -1 || root.val != root.right!.val {
            valR = root.right!.val
        }
        
        if valL == root.val && valR == root.val {
            return -1
        } else if valL == root.val {
            return valR
        } else if valR == root.val {
            return valL
        } else {
            return valL + valR + root.val - max(valL, valR, root.val) - min(valL, valR, root.val)
        }
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
        nodes[idxP]?.right = nodes[idxC]
        idxC += 1
        idxP += 1
    }
    return nodes[0]
}

let s = Solution()
assert(s.findSecondMinimumValue(rootNode([2,2,2])) == -1)
assert(s.findSecondMinimumValue(rootNode([2,2,5,nil,nil,5,7])) == 5)
assert(s.findSecondMinimumValue(rootNode([1,1,3,1,1,3,4,3,1,1,1,3,8,4,8,3,3,1,6,2,1])) == 2)
print("done")
