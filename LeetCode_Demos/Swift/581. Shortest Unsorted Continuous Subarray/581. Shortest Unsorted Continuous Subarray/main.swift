//
//  main.swift
//  581. Shortest Unsorted Continuous Subarray
//
//  Created by ada_PC007 on 2017/9/4.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func findUnsortedSubarray(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return 0
        }
        let sorted = nums.sorted()
        var length = sorted.count, lo = 0, hi = length-1
        
        while lo < length && nums[lo] == sorted[lo] {
            lo += 1
        }
        while hi > lo && nums[hi] == sorted[hi] {
            hi -= 1
        }
        return hi - lo + 1
    }
}

print(Solution().findUnsortedSubarray([2,6,4,8,10,9,15]))
