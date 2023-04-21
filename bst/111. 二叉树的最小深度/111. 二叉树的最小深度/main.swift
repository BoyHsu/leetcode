//
//  main.swift
//  111. 二叉树的最小深度
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
//    var minHeight = Int.max
//
//    func minDepth(_ root: TreeNode?) -> Int {
//        bfs(root, height: 0)
//        return minHeight
//    }
//
//    private func bfs(_ node: TreeNode?, height: Int) {
//        if node == nil {
//            return
//        }
//        let height = height + 1
//        if node?.left == nil && node?.right == nil {
//            if minHeight > height {
//                minHeight = height
//            }
//        }
//
//        bfs(node?.left, height: height)
//        bfs(node?.right, height: height)
//    }
    
//    func minDepth(_ root: TreeNode?) -> Int {
//        guard let root = root else { return 0 }
//        var nodes = [root]
//        var heights = [1]
//        var minHeight = Int.max
//        while !nodes.isEmpty {
//            let node = nodes.removeFirst()
//            let height = heights.removeFirst()
//
//            if node.left == nil && node.right == nil {
//                if height < minHeight {
//                    minHeight = height
//                }
//            } else {
//                if let l = node.left {
//                    nodes.append(l)
//                    heights.append(height+1)
//                }
//                if let r = node.right {
//                    nodes.append(r)
//                    heights.append(height+1)
//                }
//            }
//        }
//        return minHeight
//    }
    
    func minDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        if root.left == nil && root.right == nil {
            return 1
        }
        
        var minHeight = Int.max
        
        if let l = root.left {
            minHeight = min(minHeight, minDepth(l))
        }
        
        if let r = root.right {
            minHeight = min(minHeight, minDepth(r))
        }
        
        return 1 + minHeight
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
        if let node = nodes[idxP] {
            node.left = nodes[idxC]
            idxC += 1
            node.right = nodes[idxC]
            idxC += 1
        }
        idxP += 1
    }
    return nodes[0]
}

var root = rootNode([3,9,20,nil,nil,15,7])
let s = Solution()
assert(s.minDepth(root) == 2)
root = rootNode([2,nil,3,nil,4,nil,5,nil,6])
assert(s.minDepth(root) == 5)
print("done")
