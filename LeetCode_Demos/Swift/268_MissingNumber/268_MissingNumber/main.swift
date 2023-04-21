//
//  main.swift
//  268_MissingNumber
//
//  Created by ada_PC007 on 2017/5/10.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return nums[0] + 1 - 2 * (nums[0]&1)
        }

        let dif = nums[0] > nums[1] ? -1 : 1
        var i = 0
        
        while i < nums.count - 1 {
            if nums[i] + dif != nums[i+1] {
                break;
            }
            i+=1
        }
        
        var missing = 0
        if dif == 1 {
            if nums[0] > 0 {
                missing = nums[0]-dif
            } else {
                missing = nums[i]+dif
            }
        } else {
            if nums[i] == 0 {
                missing = nums[0]-dif
            } else {
                missing = nums[i]+dif
            }
        }
        
        return missing
//        return nums[i] == 0||nums[0] > 0 ? nums[0]-dif : nums[1]+dif
    }
}

print(Solution().missingNumber([0,2]))
