//
//  main.swift
//  109. Convert Sorted List to Binary Search Tree
//
//  Created by ada_PC007 on 2017/8/11.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

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
    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        return buildBST(head, nil)
    }
    
    func buildBST(_ start: ListNode?, _ end: ListNode?) -> TreeNode? {
        if start?.val == end?.val {
            return nil
        }
        
        print("start == ", (start?.val)!, ", end == ", end?.val ?? "nil")
        var slow = start, fast = slow
        while fast?.val != end?.val && fast?.next?.val != end?.val  {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        let node = TreeNode((slow?.val)!)
        
        if end?.val != slow?.val {
            node.left = buildBST(start, slow)
            node.right = buildBST(slow?.next, end)
        }
        
        return node
    }
}

func buildLinkedList(_ nums: [Int]) -> ListNode {
    var head = ListNode(0), x = head
    
    for num in nums {
        x.next = ListNode(num)
        x = x.next!
    }
    return head.next!
}

func traverse(_ root: TreeNode) {
    var queue: [Any] = [root]
    var str = ""
    
    while !queue.isEmpty {
        for _ in 0..<queue.count {
            let node = queue.remove(at: 0)
            
            if node is NSNull {
                str += "nil\t"
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

let head = buildLinkedList(Array(1...9))
let root = Solution().sortedListToBST(head)
traverse(root!)
