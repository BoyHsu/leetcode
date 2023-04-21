//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

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
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var newHead = head
        var node = newHead
        var dic = [Int:ListNode]()
        var i = 0
        
        while node != nil {
            dic[i] = node
            i += 1
            node = node?.next
        }
        
        let target = i - n
        
        if target == 0 {
            newHead = newHead?.next
        } else {
            dic[target - 1]?.next = dic[target + 1]
        }
        
        return newHead
    }
}

let sol = Solution()
sol.removeNthFromEnd(ListNode(1), 1)

