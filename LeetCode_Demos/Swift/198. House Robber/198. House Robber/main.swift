//
//  main.swift
//  198. House Robber
//
//  Created by ada_PC007 on 2017/8/25.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func rob(_ nums: [Int]) -> Int {
        return maxRob(nums, 0, nums.count, 0)
    }
    
    func maxRob(_ nums: [Int], _ lo: Int, _ hi: Int , _ sum: Int) -> Int {
        if lo >= hi {
            return 0
        }
        if lo >= hi - 2 {
            if lo == hi - 1 {
                return nums[lo] + sum
            } else {
                return max(nums[lo], nums[lo+1]) + sum
            }
        }
        let not = maxRob(nums, lo+1, hi, sum), does = maxRob(nums, lo+2, hi, sum+nums[lo])
        
        print("preSum == ", sum, "\tnum == ", nums[lo], "\tdoes == ", does, " \tnot == ", not)
        return max(does, not)
    }
}

print(Solution().rob([104,209,137,52,158,67,213,86,141,110,151,127,238,147,169,138,240,185,246,225,147,203,83,83,131,227,54,78,165,180,214,151,111,161,233,147,124,143]))//3176
