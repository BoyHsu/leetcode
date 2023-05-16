//
//  main.swift
//  25. K 个一组翻转链表
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
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        let vh = ListNode(0, head)
        var current = head, q: ListNode? = vh
        
        while true {
            for _ in 0..<k-1 {
                current = current?.next
            }
            if current == nil {
                break
            }
            
            let first = q?.next
            let nextFirst = current?.next
            current = first?.next
            
            for _ in 0..<k-1 {
                let temp = current?.next
                current?.next = q?.next
                q?.next = current
                current = temp
            }
            
            first?.next = nextFirst
            q = first
            current = nextFirst
        }
        
        return vh.next
    }
}

