//
//  main.swift
//  152. Maximum Product Subarray
//
//  Created by ada_PC007 on 2017/8/31.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return nums[0]
        }
        
        var values = [Int](), minusIdxs = [Int]()
        var p = 1
        
        for i in 0..<nums.count {
            if nums[i] < 0 {
                if p != 1 {
                    values.append(p)
                }
                minusIdxs.append(values.count)
                values.append(nums[i])
                p = 1
            } else {
                if nums[i] != 0 {
                    p *= nums[i]
                }
            }
        }
        values.append(p)
        
        print(values)
        func product(_ ns: [Int], _ lo: Int, _ hi: Int) -> Int {
            var p: Int = 1
            
            for i in lo..<hi {
                print(p, ns[i])
                p *= ns[i]
            }
            return p
        }
        
        if minusIdxs.count & 1 == 0 {
            
            return product(values, 0, values.count);
        } else {
//            print(product(nums, 0, nums.count))
            return max(product(values, 0, minusIdxs.last!), product(values, minusIdxs[0]+1, values.count))
        }
    }
}

print(Solution().maxProduct([1,-1]))
