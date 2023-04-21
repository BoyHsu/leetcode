//
//  main.swift
//  35. Search Insert Position
//
//  Created by ada_PC007 on 2017/6/15.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var lo = 0, hi = nums.count
        
        while lo < hi {
            let mi = (lo + hi) >> 1
            if nums[mi] < target  {
                lo = mi+1
            } else {
                hi = mi
            }
        }
        return lo
    }
}

print(Solution().searchInsert([1,3,5,6], 3))
