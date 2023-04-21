
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
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }
        var newHead: ListNode = head!
        
        if newHead.val == newHead.next?.val {
            let val = newHead.val
            while newHead.val != val {
                newHead = newHead.next!
            }
        }
        
        var node = newHead.next
        var last = newHead
        
        while node != nil {
            if node?.val == node?.next?.val {
                let val = node?.val
                while node?.val == val {
                    node = node?.next
                }
                last.next = node!
            }
            
            last = node!
            if node != nil {
                node = node?.next
            }
        }
        
        return newHead
    }
}

let sol = Solution()

let nums = [1,1,1,1,2,2,3]
var head: ListNode? = nil

for num in nums.reversed() {
    if head == nil {
        head = ListNode(num)
    } else {
        let temp = ListNode(num)
        temp.next = head
        head = temp
    }
}


sol.deleteDuplicates(head)

while head != nil {
    print(head?.val ?? "null")
    head = head?.next
}


