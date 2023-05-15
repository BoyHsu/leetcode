//
//  main.swift
//  21. 合并两个有序链表
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
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var head: ListNode? = nil, list1 = list1, list2 = list2
        if (list1?.val ?? Int.min) > (list2?.val ?? Int.min) {
            head = list1
            list1 = list1?.next
        } else {
            head = list2
            list2 = list2?.next
        }
        var p = head
        while list1 != nil, list2 != nil {
            if list1!.val < list2!.val {
                p?.next = list1
                p = list1
                list1 = list1?.next
            } else {
                p?.next = list2
                p = list2
                list2 = list2?.next
            }
            p = p?.next
        }
        while list1 != nil {
            p?.next = list1
            p = list1
            list1 = list1?.next
        }
        while list2 != nil {
            p?.next = list2
            p = list2
            list2 = list2?.next
        }
        return head
    }
}

func makeNumList(nums: [Int]) -> ListNode? {
    var head: ListNode? = nil
    var p: ListNode? = nil
    for num in nums {
        let node = ListNode(num)
        p?.next = node
        p = node
        if head == nil {
            head = p
        }
    }
    return head
}

extension ListNode? {
    func toArr() -> [Int] {
        var res = [Int]()
        var node: ListNode? = self
        while node != nil {
            res.append(node!.val)
            node = node?.next
        }
        return res
    }
}

//[1,2,4]
//[1,3,4]
let s = Solution()
assert(s.mergeTwoLists(makeNumList(nums: [1,2,4]), makeNumList(nums: [1,3,4])).toArr() ==
       [1,1,2,3,4,4])
print("done")

