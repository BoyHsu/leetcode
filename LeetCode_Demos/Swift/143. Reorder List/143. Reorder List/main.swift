//
//  main.swift
//  143. Reorder List
//
//  Created by ada_PC007 on 2017/8/1.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation


//Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func reorderList(_ head: ListNode?) {
        if head == nil {
            return
        }
        var x = head
        
        var nodes = [ListNode]()
        while x != nil {
            nodes.append(x!)
            x = x?.next
        }
        x = nodes.remove(at: 0)
        while !nodes.isEmpty {
            x?.next = nodes.popLast()
            if !nodes.isEmpty {
                x?.next?.next = nodes.remove(at: 0)
                x = x?.next?.next
                x?.next = nil
            } else {
                x?.next?.next = nil
            }
        }
    }
}

class Solution1 {
    func reorderList(_ head: ListNode?) {
        if head == nil {
            return
        }
        var x = head
        
        var nodes = [ListNode]()
        while x != nil {
            nodes.append(x!)
            x = x?.next
        }
        
        var lo = 0, hi = nodes.count-1
        
        while lo < hi {
            let n1 = nodes[lo], n2 = nodes[hi]
            n2.next = n1.next
            n1.next = n2
            lo += 1
            hi -= 1
        }
        nodes[lo].next = nil
    }
}

let head = ListNode(1)
var x: ListNode? = head

for i in 2...9 {
    x?.next = ListNode(i)
    x = x?.next!
}

Solution1().reorderList(head)

x = head

while x != nil {
    print(x?.val ?? "nil")
    x = x?.next
}



