//
//  main.swift
//  23. 合并 K 个升序链表
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

//class Solution {
//    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
//        guard lists.count > 0 else { return nil }
//        var i = 0
//        while i<lists.count, lists[i] == nil {
//            i += 1
//        }
//        if i == lists.count {
//            return nil
//        }
//
//        var head = lists[i]
//        i += 1
//        while i < lists.count {
//            if lists[i] == nil {
//                i += 1
//                continue
//            }
//            var h1 = head, h2 = lists[i]
//            if h1!.val > h2!.val {
//                head = h2
//                h2 = h2?.next
//            } else {
//                h1 = h1?.next
//            }
//            var p = head
//            while h1 != nil, h2 != nil {
//                if h1!.val > h2!.val {
//                    p?.next = h2
//                    p = h2
//                    h2 = h2?.next
//                } else {
//                    p?.next = h1
//                    p = h1
//                    h1 = h1?.next
//                }
//            }
//
//            p?.next = h1 ?? h2
//
//            i += 1
//        }
//
//        return head
//    }
//}

class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        return merge(lists, 0, lists.count)
    }
    
    func merge(_ lists: [ListNode?], _ from: Int, _ to: Int) -> ListNode? {
        if from == to {
            return nil
        } else if from + 1 == to {
            return lists[from]
        }
        let mi = (from + to) / 2
        var h1 = merge(lists, from, mi)
        var h2 = merge(lists, mi, to)
        
        let head: ListNode?
        if (h1?.val ?? Int.max) > (h2?.val ?? Int.max) {
            head = h2
            h2 = h2?.next
        } else {
            head = h1
            h1 = h1?.next
        }
        var p = head
        while h1 != nil, h2 != nil {
            if h1!.val > h2!.val {
                p?.next = h2
                p = h2
                h2 = h2?.next
            } else {
                p?.next = h1
                p = h1
                h1 = h1?.next
            }
        }
        p?.next = h1 ?? h2
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

//[[1,4,5],[1,3,4],[2,6]]
//[1,1,2,3,4,4,5,6]

let s = Solution()
assert(s.mergeKLists([makeNumList(nums: [1,4,5]), makeNumList(nums: [1,3,4]), makeNumList(nums: [2,6])]).toArr() == [1,1,2,3,4,4,5,6])
print("done")

