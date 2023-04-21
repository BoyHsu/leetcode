//
//  main.swift
//  6k3. Maximum Average Subarray I
//
//  Created by ada_PC007 on 2017/8/30.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
        if nums.count < k {
            return 0
        }
        var sum = 0
        
        for i in 0..<k {
            sum += nums[i]
        }
        var res = sum
        
        for i in k..<nums.count {
            let diff = (nums[i]-nums[i-k])
            
            sum += diff
            if diff > 0 {
                res = sum
            }
        }
        return Double(res)/Double(k)
    }
}

