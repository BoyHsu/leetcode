//
//  main.swift
//  24. 两两交换链表中的节点
//
//  Created by 徐恩 on 2023/5/16.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        var vh = ListNode(0)
        
        var p = head, q: ListNode? = vh
        while p != nil, p?.next != nil {
            let temp = p?.next?.next
            q?.next = p?.next
            q?.next?.next = p
            q = p
            p = temp
        }
        q?.next = p
        
        return vh.next
    }
}

