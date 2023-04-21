//
//  main.swift
//  563. 二叉树的坡度
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
    func findTilt(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        return _findSumAndTilt(root).1
    }
    
    func _findSumAndTilt(_ node: TreeNode) -> (Int, Int) {
        if node.left == nil, node.right == nil {
            return (node.val, 0)
        }
        
        var sum = node.val, tilt = 0, tiltSum = 0
        if let l = node.left {
            let (s, t) = _findSumAndTilt(l)
            sum += s
            tilt += s
            tiltSum += t
        }
        
        if let r = node.right {
            let (s, t) = _findSumAndTilt(r)
            sum += s
            tilt -= s
            tiltSum += t
        }
        
        return (sum, abs(tilt) + tiltSum)
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
assert(s.findTilt(rootNode([1,2,3])) == 1)
assert(s.findTilt(rootNode([4,2,9,3,5,nil,7])) == 15)
print("done")
