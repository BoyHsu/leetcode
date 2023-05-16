//
//  main.swift
//  26. 删除有序数组中的重复项
//
//  Created by 徐恩 on 2023/5/16.
//

import Foundation

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        
        var l = 1
        for r in 1..<nums.count {
            if nums[r] != nums[r-1], r > l {
                nums[l] = nums[r]
                l+=1
            }
        }
        return l
    }
}

