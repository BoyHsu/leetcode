//
//  main.swift
//  653. Two Sum IV - Input is a BST
//
//  Created by ada_PC007 on 2017/8/8.
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
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
        if root == nil {
            return false
        }
        var stack = [TreeNode](), vals = [Int]()
        var x = root
        
        while true {
            while x != nil {
                stack.append(x!)
                x = x?.left
            }
            if stack.isEmpty {
                break
            }
            x = stack.popLast()
            vals.append((x?.val)!)
            x = x?.right
        }
        
        func binarySearch(_ target: Int, _ lo: Int, _ hi: Int) -> Bool {
            var l = lo, r = hi
            
            while l < r {
                let mi = (l + r) >> 1
                if target < vals[mi] {
                    r = mi
                } else {
                    l = mi + 1
                }
            }
            if l == lo {
                return false
            } else {
                return vals[l-1] == target
            }
        }
        for i in 0..<vals.count {
            if binarySearch(k-vals[i], i+1, vals.count) {
                return true
            }
        }
        
        return false
    }
}

class Solution1 {
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
        if root == nil {
            return false
        }
        var stack = [TreeNode]()
        var x = root
        var dict = [Int: Bool]()
        
        
        while true {
            while x != nil {
                stack.append(x!)
                x = x?.left
            }
            if stack.isEmpty {
                break
            }
            x = stack.popLast()
            if dict[k-(x?.val)!] == true {
                return true
            } else {
                dict[(x?.val)!] = true
            }
            x = x?.right
        }
        
        return false
    }
}

func buildTree(_ nums: [Int]) -> TreeNode? {
    if nums.isEmpty {
        return nil
    }
    var root = TreeNode(nums.first!)
    var queue = [root]
    var idx = 0
    
    func getValue(_ node: inout TreeNode?) {
        idx+=1
        if idx < nums.count {
            if nums[idx] != 0 {
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

func traverse(_ node: TreeNode?) {
    if node == nil {
        print("null")
        return
    }
    
    var queue: [Any] = [root!]
    var str = ""
    
    while !queue.isEmpty {
        for _ in 0..<queue.count {
            let node = queue.remove(at: 0)
            if node is NSNull {
                str += "0 \t"
            } else {
                let node = node as! TreeNode
                str += "\(node.val) \t"
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
            }
        }
        str += "\n"
    }
    print(str)
}

let root = buildTree([5,3,6,2,4,0,7])

print(Solution1().findTarget(root, 9))
