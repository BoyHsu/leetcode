//
//  main.swift
//  540. Single Element in a Sorted Array
//
//  Created by ada_PC007 on 2017/5/22.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func singleNonDuplicate(_ nums: [Int]) -> Int {
        if nums.count < 2 {
            return nums.first!
        }
        var i = 0, j = 1, r = nums.last!
        while j<nums.count {
            if nums[i] != nums[j] {
                if j-i == 1 {
                    r = nums[i]
                    break
                }
                i=j
            }
            j+=1
        }
        return r
    }
}

print(Solution().singleNonDuplicate([1,1,2]))
