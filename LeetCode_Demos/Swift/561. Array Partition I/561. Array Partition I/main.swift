//
//  main.swift
//  561. Array Partition I
//
//  Created by ada_PC007 on 2017/6/15.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func arrayPairSum(_ nums: [Int]) -> Int {
        let nums = nums.sorted()
        var sum = 0
        
        for i in 0..<nums.count {
            if i&1 == 1 {
                continue
            }
            sum += nums[i]
        }
        return sum
    }
}

