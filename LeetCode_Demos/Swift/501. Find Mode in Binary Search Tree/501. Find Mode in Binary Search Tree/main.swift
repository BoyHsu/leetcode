//
//  main.swift
//  501. Find Mode in Binary Search Tree
//
//  Created by ada_PC007 on 2017/8/23.
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
    func findMode(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        var s = [TreeNode](), res = [Int]()
        var x = 0, y = 0, last = Int()
        var node = root
        
        func compare() {
            if !(y > x) {
                if y != x {
                    y = x
                    res.removeAll()
                }
                res.append(last)
            }
        }
        
        while true {
            while node != nil {
                s.append(node!)
                node = node?.left
            }
            if s.isEmpty {
                break
            }
            
            node = s.popLast()
            let val = (node?.val)!
            print(val)
            
            if last != val {
                compare()
                x = 0
                last = val
            }
            x += 1

            node = node?.right
        }
        compare()
        
        return res
    }
}

class Solution1 {
    
    var res = [Int]()
    var x = 0, y = 0, last = Int()
    
    func compare(_ val: Int) {
        if last != val {
            if !(y > x) {
                if y != x {
                    y = x
                    res.removeAll()
                }
                res.append(last)
            }
            x = 0
            last = val
        }
        x += 1
        
    }
    
    func findMode(_ root: TreeNode?) -> [Int] {
        recursion(root)
        compare(0)
        return res
    }
    
    func recursion(_ root: TreeNode?) {
        if root == nil {
            return
        }
        recursion(root?.left)
        print((root?.val)!)
        compare((root?.val)!)
        recursion(root?.right)
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

func traverseByDepth(_ root: TreeNode?){
    if root == nil {
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
                notAllNull = notAllNull || (node.left != nil || node.right != nil)
            }
            str += "\t"
        }
        str += "\n"
    }
    print(str)
}

let root = buildTree([1,0,2,2,3,1,2,3,4,0,0,2,0,3,3,4,4,0,0,0,0,0,0,4,4])
print(Solution1().findMode(root))
		
