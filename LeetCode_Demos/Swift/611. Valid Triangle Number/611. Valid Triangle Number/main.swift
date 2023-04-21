//
//  main.swift
//  611. Valid Triangle Number
//
//  Created by ada_PC007 on 2017/6/16.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func triangleNumber(_ nums: [Int]) -> Int {
        var res = [[Int]]()
        
        for i in 0..<nums.count {
            for j in i+1..<nums.count {
                for k in j+1..<nums.count {
                    if nums[i]+nums[j]>nums[k] && nums[i]+nums[k]>nums[j] && nums[j]+nums[k]>nums[i] {
                        res.append([nums[i],nums[j],nums[k]])
                    }
                }
            }
        }
        return res.count
    }
}

print(Solution().triangleNumber([2,2,3,4]))
