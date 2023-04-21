//
//  main.swift
//  148. Sort List
//
//  Created by ada_PC007 on 2017/8/2.
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
    func sortList(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }
        var nodes = [ListNode]()
        var x = head
        
        while x != nil {
            nodes.append(x!)
            x = x?.next
        }
    
        func binarySearch(_ target: Int, _ lo: Int, hi: Int) -> Int {
            var lo = lo, hi = hi
            
            while lo < hi {
                let mi = (lo + hi) >> 1
                if target < nodes[mi].val {
                    hi = mi
                } else {
                    lo = mi + 1
                }
            }
            return lo
        }
        
        for i in 1..<nodes.count {
            let node = nodes.remove(at: i)
            nodes.insert(node, at: binarySearch(node.val, 0, hi: i))
        }
        for i in 0..<nodes.count-1 {
            nodes[i].next = nodes[i+1]
        }
        nodes.last?.next = nil
        return nodes.first
    }
}

class Solution1 {
    func sortList(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }
        var nodes = [ListNode]()
        var x = head
        
        while x != nil {
            nodes.append(x!)
            x = x?.next
        }
        
        mergeSort(&nodes, 0, nodes.count)
        
        for i in 1..<nodes.count {
            nodes[i-1].next = nodes[i]
        }
        nodes.last?.next = nil
        return nodes.first
    }
    
    func mergeSort(_ nodes: inout [ListNode], _ lo: Int, _ hi: Int) {
        if hi - lo < 2 {
            return
        }
        let mi = (lo + hi) >> 1
        mergeSort(&nodes, lo, mi)
        mergeSort(&nodes, mi, hi)
        
        mergeArrays(&nodes, lo, mi, hi)
    }
    
    func mergeArrays(_ nodes: inout [ListNode], _ lo: Int, _ mi: Int, _ hi: Int) {
        var b = [ListNode]()
        
        for i in mi ..< hi {
            b.append(nodes[i])
        }
        var i = hi, i1 = mi-1, i2 = b.count - 1
        while i1 >= lo || i2 >= 0 {
            i -= 1
            var node1: ListNode?, node2: ListNode?
            
            if i1 < lo {
                node1 = ListNode(0)
            } else {
                node1 = nodes[i1]
            }
            if i2 < 0 {
                node2 = ListNode(0)
            } else {
                node2 = b[i2]
            }
            
            if i1 >= lo && (node2!.val <= node1!.val || i2 < 0) {
                nodes[i] = node1!
                i1 -= 1
                continue
            }
            if i2 >= 0 && (node1!.val < node2!.val || i1 < lo) {
                nodes[i] = node2!
                i2 -= 1
            }
        }
    }
}

let count = 100

var arr = Array(0..<count)

for i in (0..<count).reversed() {
    let idx = Int(arc4random_uniform(UInt32(i))), tem = arr[idx]
    arr[idx] = arr[i]
    arr[i] = tem
}


var nodes = [ListNode]()

for i in 0..<count {
    let node = ListNode(arr[i])
    nodes.append(node)
    if i != 0 {
        nodes[i-1].next = node
    }
}

var node = Solution1().sortList(nodes.first)

while node != nil {
    print(node?.val ?? "nil")
    node = node?.next
}

