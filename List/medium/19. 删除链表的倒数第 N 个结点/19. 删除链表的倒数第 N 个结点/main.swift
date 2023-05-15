//
//  main.swift
//  19. 删除链表的倒数第 N 个结点
//
//  Created by 徐恩 on 2023/5/15.
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
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        if head == nil {
            return nil
        }
        var fast = head
        var count = 1
        while fast?.next != nil, fast?.next?.next != nil {
            fast = fast?.next?.next
            count += 2
        }
        if fast?.next != nil {
            count += 1
        }
        
        if count == n {
            return head?.next
        } else {
            var p = head
            for _ in 0..<count-n-1 {
                p = p?.next
            }
            p?.next = p?.next?.next
            
            return head
        }
    }
}

