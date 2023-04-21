//
//  main.swift
//  2_AddTwoNumbers
//
//  Created by ada_PC007 on 2017/5/11.
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
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let head = ListNode(0)
        var h1 = l1, h2 = l2, h3 = head
        var shouldAdd = false
        
        while h1 != nil || h2 != nil {
            let sum = (h1 == nil ? 0 : (h1?.val)!) + (h2 == nil ? 0 : (h2?.val)!) + (shouldAdd ? 1 : 0)
            
            let next = ListNode(sum)
            shouldAdd = next.val >= 10
            next.val %= 10
            
            h3.next = next
            h1 = h1?.next
            h2 = h2?.next
            h3 = next
        }
        if shouldAdd {
            h3.next = ListNode(1)
        }
        return head.next
    }
}

