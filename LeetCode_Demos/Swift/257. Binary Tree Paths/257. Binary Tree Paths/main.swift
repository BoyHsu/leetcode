//
//  main.swift
//  257. Binary Tree Paths
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
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        var res = [String]()
        
        stringJoint(root, "", &res)
        return res
    }
    
    func stringJoint(_ node: TreeNode?, _ str: String, _ strArr: inout [String]) {
        if node == nil {
            return
        }
        var str = str
        if str.characters.count > 1 {
            str.append("->")
        }
        str.append("\((node?.val)!)")
        if node?.right == nil && node?.left == nil {
            strArr.append(str)
            return
        }
        stringJoint(node?.left, str, &strArr)
        stringJoint(node?.right, str, &strArr)
    }
}



