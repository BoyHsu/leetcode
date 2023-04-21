//
//  main.swift
//  637. 二叉树的层平均值
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
    func averageOfLevels(_ root: TreeNode?) -> [Double] {
        var res = [Double]()
        var queue = [root!]
        
        while !queue.isEmpty {
            var curFloor = [TreeNode]()
            var avg = Double(0)
            var count = Double(queue.count)
            for node in queue {
                avg += Double(node.val)/count
                if let l = node.left {
                    curFloor.append(l)
                }
                if let r = node.right {
                    curFloor.append(r)
                }
            }
            res.append(round(avg*1e-5)/1e-5)
            queue = curFloor
        }
        
        return res
    }
}

