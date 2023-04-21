//
//  main.swift
//  523. Continuous Subarray Sum
//
//  Created by ada_PC007 on 2017/5/15.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func checkSubarraySum(_ nums: [Int], _ k: Int) -> Bool {
        if nums.count < 2 {
            return false
        }
        if k == 0 {
            var zeroSum = 0
            for i in nums {
                zeroSum+=i
            }
            return zeroSum == 0
        }
        if nums.count == 2 {
            return (nums[0]+nums[1])%k==0
        }
        var sum = 0
        for i in nums {
            sum+=i
        }
        if sum%k == 0 {
            return true
        } else {
            return checkSubarraySum(Array(nums[1..<nums.count]), k) || checkSubarraySum(Array(nums[0..<nums.count-1]), k)
        }
    }
}

class Solution1 {
    func checkSubarraySum(_ nums: [Int], _ k: Int) -> Bool {
        if nums.count < 2 {
            return false
        }
        if k == 0 {
            var zeroSum = 0
            for i in nums {
                zeroSum+=i
            }
            return zeroSum == 0
        }
        
        var result = false
        var s = nums
        var end = nums.count
        
        while end > 1 {
            end-=1
            for i in 0..<end {
                s[i]+=nums[i+nums.count-end]
                if s[i]%k == 0 {
                    end = 0
                    result = true
                    break
                }
            }
        }
        return result
    }
}

print(Solution1().checkSubarraySum([23,2,6,4,7], 6))
