
// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        var newHead = head
        
        while newHead?.val == val {
            newHead = newHead?.next
        }
        
        var node = newHead
        var last: ListNode
        
        while node != nil {
            last = node!
            node = node?.next
            if node?.val == val {
                last.next = node?.next
                node = last
            }
        }
        return newHead
    }
}

let sol = Solution()

let vals = [1,2,2,3,1]
var head: ListNode?

for val in vals.reversed() {
    let node = ListNode(val)
    if head == nil {
        head = node
    } else {
        node.next = head
        head = node
    }
}

sol.removeElements(head, 2)

while head != nil {
    print(head?.val ?? "null")
    head = head?.next
}

		