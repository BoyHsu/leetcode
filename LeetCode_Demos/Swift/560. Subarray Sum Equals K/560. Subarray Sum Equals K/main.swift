//
//  main.swift
//  560. Subarray Sum Equals K
//
//  Created by ada_PC007 on 2017/5/16.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        if nums.count < 1 {
            return 0
        }
        var c = 0
        
        for i in 0..<nums.count {
            var sum = 0
            
            for j in i..<nums.count {
                sum += nums[j]
                if sum == k {
                    c+=1
                }
            }
        }
        
        return c
    }
}

class Solution1 {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        if nums.count < 1 {
            return 0
        }
        var c = 0
        var r = Array(repeating: 0, count: nums.count)
        
        for j in 0..<nums.count {
            for i in 0..<nums.count-j {
                r[i]+=nums[j+i]
                if r[i]==k {
                    c+=1
                }
            }
        }
        
        return c
    }
}

print(Solution().subarraySum([1] ,2))
