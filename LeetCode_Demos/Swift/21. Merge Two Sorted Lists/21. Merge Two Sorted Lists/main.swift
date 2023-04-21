//
//  main.swift
//  21. Merge Two Sorted Lists
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
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1: ListNode? = l1, l2: ListNode? = l2 , x = ListNode(0), y = x
        
        while l1 != nil && l2 != nil {
            
            if (l1?.val ?? 0 >= l2?.val ?? 0) && l2 != nil {
                x.next = l2!
                l2 = l2?.next
                x = x.next!
            }
            if l1?.val ?? 0 < l2?.val ?? 0 && l1 != nil {
                x.next = l1!
                l1 = l1?.next
                x = x.next!
            }
        }
        x.next = l1 ?? l2
        return y.next
    }
}

let l1 = ListNode(Int(arc4random_uniform(UInt32(32)))), l2 = ListNode(Int(arc4random_uniform(UInt32(32))))
var l3 = l1, l4 = l2

for _ in 0..<3 {
    l3.next = ListNode(l3.val + Int(arc4random_uniform(UInt32(32))))
    l3 = l3.next!
    
    l4.next = ListNode(l4.val + Int(arc4random_uniform(UInt32(32))))
    l4 = l4.next!
}

var array = [l1, l2]
func traverseArray() {
    for i in 0..<array.count {
        var x: ListNode? = array[i]
        print(i, "begin")
        
        while x != nil {
            print(x?.val ?? "nil")
            x = x?.next
        }
        print("\n")
    }
}

traverseArray()

array = [Solution().mergeTwoLists(l1, l2)!]

traverseArray()

		
