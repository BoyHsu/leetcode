//
//  main.swift
//  628. Maximum Product of Three Numbers
//
//  Created by ada_PC007 on 2017/8/30.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func maximumProduct(_ nums: [Int]) -> Int {
        var nums = nums
        let c = nums.count
        
        for i in 0..<3 {
            for j in 0..<c-i-1 {
                if nums[j] > nums[j+1] {
                    swap(&nums[j], &nums[j+1])
                }
            }
        }
        for i in 0..<min(2, c-3) {
            for j in 0..<c-i-1-3 {
                if nums[j] < nums[j+1] {
                    swap(&nums[j], &nums[j+1])
                }
            }
        }
        print(nums)
        var res = nums[c-1]*nums[c-2]*nums[c-3]
        if c >= 5 {
            res = max(res, nums[c-1]*nums[c-4]*nums[c-5])
        }
        
        return res
    }
}

class Solution1 {
    func maximumProduct(_ nums: [Int]) -> Int {
        var h = nums
        
        func percolateDown(_ n: Int, _ i: Int) {
            var i = i, j = i, e = h[i]
            
            while properParent(n, i, &j) {
                if h[j] > e {
                    h[i] = h[j]
                } else {
                    break
                }
                i = j
            }
            h[i] = e
        }
        
        func properParent(_ n:Int, _ i: Int, _ j: inout Int) -> Bool {
            let l = 1+(i<<1), r = (i+1)<<1
            
            if (l<n && r<n) {
                j = h[l]>h[r] ? l : r
                return true
            } else if (l < n && r >= n) {
                j = l
                return true
            }
            return false
        }
        
        func delMax() -> Int {
            let e = h[0]
            h[0] = h.last!
            _ = h.popLast()
            if !h.isEmpty {
                percolateDown(h.count, 0)
            }
            return e
        }
        
        for k in (0...((h.count-1)>>1)).reversed() {
            percolateDown(h.count, k)
        }
        
        var nums = nums
        for i in 0..<nums.count {
            nums[i] = delMax()
        }
        
        let c = nums.count
        
        var res = nums[0]*nums[1]*nums[2]
        if c >= 5 {
            res = max(res, nums[c-1]*nums[c-2]*nums[0])
        }
        
        return res
    }
}
class Solution2 {
    func maximumProduct(_ nums: [Int]) -> Int {
        var lo1 = Int.max, lo2 = lo1, max1 = Int.min, max2 = max1, max3 = max2
        
        for i in <#items#> {
            <#code#>
        }
        
        return res
    }
}

print(Solution().maximumProduct([1,2,3,4]))
