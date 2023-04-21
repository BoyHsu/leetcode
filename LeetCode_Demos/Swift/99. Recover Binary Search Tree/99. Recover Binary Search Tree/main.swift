//
//  main.swift
//  99. Recover Binary Search Tree
//
//  Created by ada_PC007 on 2017/8/24.
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
    
    func recoverTree(_ root: TreeNode?) {
        if root == nil {
            return
        }
        var dict = [Int: TreeNode]()
        var inorderTraverse = [Int.min], s = [TreeNode]()
        var x = root
        
        while true {
            while x != nil {
                s.append(x!)
                x = x?.left
            }
            if s.isEmpty {
                break
            }
            x = s.popLast()
            inorderTraverse.append((x?.val)!)
            dict[(x?.val)!] = x
            x = x?.right
        }

        var front = -1, behind = -1
        inorderTraverse.insert(Int.max, at: inorderTraverse.count)
        print(inorderTraverse)
        for i in 1..<inorderTraverse.count-1 {
            if inorderTraverse[i-1] < inorderTraverse[i]  && inorderTraverse[i] > inorderTraverse[i+1]  {
                if front == -1 {
                    front = i
                }
            }
            if inorderTraverse[i-1] > inorderTraverse[i]  && inorderTraverse[i] < inorderTraverse[i+1] {
                if front != i-1 {
                    behind = i
                }
            }
        }
        if front != -1 || behind != -1 {
            let frontN = dict[inorderTraverse[front == -1 ? behind-1 : front]], behindN = dict[inorderTraverse[behind == -1 ? front+1 : behind]]
            
            let temp = frontN?.val
            frontN?.val = (behindN?.val)!
            behindN?.val = temp!
        }
    }
}

class Solution1 {
    func recoverTree(_ root: TreeNode?) {
        if root == nil {
            return
        }
        var beforeLast = TreeNode(Int.min), last: TreeNode?, front: TreeNode?, behind: TreeNode?, x = root
        var s = [TreeNode]()
        
        while true {
            while x != nil {
                s.append(x!)
                x = x?.left
            }
            if s.isEmpty {
                break
            }
            x = s.popLast()
            if last != nil {
               
                if beforeLast.val < (last?.val)! && (last?.val)! > (x?.val)! {
                    if front == nil {
                        front = last
                    }
                }
                if beforeLast.val > (last?.val)! && (last?.val)! < (x?.val)! {
                    if front == nil {
                        front = beforeLast
                    }
                    behind = last
                }
                
                
                beforeLast = last!
            }
            last = x
            x = x?.right
        }
        if beforeLast.val > (last?.val)! {
            behind = last
        }
        
        if behind == nil {
            behind = front?.right
            while behind?.left != nil {
                behind = behind?.left
            }
        }
        let temp = behind?.val
        behind?.val = (front?.val)!
        front?.val = temp!
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
            if nums[idx] > -10 {
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

func traverse(_ root: TreeNode?) {
    if root == nil {
        print("nil")
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
                
                str += "\(node.val)"
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
                notAllNull = notAllNull || (node.right != nil || node.left != nil)
            }
            str += "\t"
        }
        str += "\n"
    }
    print(str)
}

//let root = buildTree([6,9,3,1,4,7,10,0,2,0,5,0,8])
let root = buildTree([10,5,15,0,8,13,20,2,-5,6,9,12,14,18,25])
//let root = buildTree([0,1])
traverse(root)

Solution1().recoverTree(root)

traverse(root)
