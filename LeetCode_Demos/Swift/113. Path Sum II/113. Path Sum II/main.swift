//
//  main.swift
//  113. Path Sum II
//
//  Created by ada_PC007 on 2017/8/3.
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



let depth = 6, count = 1<<depth - 1
var nums  = Array(0..<count)

for i in (0..<count).reversed() {
    var idx = Int(arc4random_uniform(UInt32(i))), tem = nums[i]
    nums[i] = nums[idx]
    nums[idx] = tem
}
nums[0] += 10
nums[1] += 10
nums[2] += 10

for i in 0..<depth {
    var str = ""
    
    if i == 0 {
        str.append("\(nums[0])")
    } else {
        for j in 1 << i ..< 1 << (i+1) {
            str.append("\(nums[j-1]) ")
        }
    }
}

var root = TreeNode(nums.first!)
var queue: [Any] = [root]

for i in 0 ..< depth-1 {
    var idx = 1
    
    for j in 0 ..< queue.count {
        var node = queue.remove(at: 0)
        if node is NSNull {
            continue
        }

        if nums[idx] > 10 {
            let left =  TreeNode(nums[idx])
            (node as! TreeNode).left = left
            idx += 1
            queue.append(left)
        }
        if nums[idx] > 10 {
            let right =  TreeNode(nums[idx])
            (node as! TreeNode).right = right
            idx += 1
            queue.append(right)
        }
    }
}

nums = [5,4,8,11,0,13,4,7,2,0,0,5,1]
root = TreeNode(nums.first!)
var queue1 = [root]
var reverse: [Any] = [root.val]

func pushNode(_ node: TreeNode?, _ array: inout [Any], _ nodes: inout [TreeNode]) {
    if node != nil {
        array.append((node?.val)!)
        nodes.append(node!)
    } else {
        array.append("null")
    }
}

var index = 1

func traverseQueue() {
    for node in queue1 {
        print(node.val)
    }
}

while !queue1.isEmpty && index < nums.count {
    for _ in 0 ..< queue1.count {
        if index >= nums.count  {
            break
        }
        let node = queue1.remove(at: 0)
        if nums[index] > 0 {
            node.left = TreeNode(nums[index])
        }
        index += 1
        if nums[index] > 0 {
            node.right = TreeNode(nums[index])
        }
        index += 1
        pushNode(node.left, &reverse, &queue1)
        pushNode(node.right, &reverse, &queue1)
    }
}

class Solution {
    func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
        if root == nil {
            return []
        }
        var res = [[Int]]()
        recurring(root, sum, [], &res)
        return res
    }
    func recurring(_ node: TreeNode?, _ target: Int, _ vals: [Int], _ resArr: inout [[Int]]) {
        
        if node?.left == nil && node?.right == nil {
            print(vals)
            var sum = 0
            for i in vals {
                sum += i
            }
            if sum == target {
                resArr.append(vals)
            }
            return
        }
        if node == nil {
            return
        }
        var vals = vals
        vals.append((node?.val)!)
        
        recurring(node?.left, target, vals, &resArr)
        recurring(node?.right, target, vals, &resArr)
    }
}

print()
print(Solution().pathSum(root, 22))
