//
//  main.swift
//  538. Convert BST to Greater Tree
//
//  Created by ada_PC007 on 2017/8/14.
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
    func convertBST(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return nil
        }
        var s = [TreeNode](), arr = [TreeNode]()
        
        func goLongLeft(_ node: TreeNode?) {
            var node = node
            
            while node != nil {
                s.append(node!)
                node = node?.left
            }
        }
        
        var x = root
        
        while true {
            goLongLeft(x)
            if s.isEmpty {
                break
            }
            x = s.popLast()
            arr.append(x!)
            x = x?.right
        }
        
        for i in (0..<arr.count-1).reversed() {
            arr[i].val += arr[i+1].val
        }
        return root
    }
}

class Solution1 {//traverse from right to left by inorder
    func convertBST(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return nil
        }
        var s = [TreeNode]()
        var sum = 0
        
        func goLongRight(_ node: TreeNode?) {
            var node = node
            
            while node != nil {
                s.append(node!)
                node = node?.right
            }
        }
        
        var x = root
        
        while true {
            goLongRight(x)
            if s.isEmpty {
                break
            }
            x = s.popLast()
            sum += (x?.val)!
            x?.val = sum
            x = x?.left
        }
        
        return root
    }
}

