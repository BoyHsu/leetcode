//
//  main.swift
//  456. 132 Pattern
//
//  Created by ada_PC007 on 2017/5/25.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func find132pattern(_ nums: [Int]) -> Bool {
        
        if nums.count < 3 {
            return false
        }
        
        var inversion: Int?, mini = Int.max
        for i in 0..<nums.count-1 {
            mini = min(mini, nums[i])
            if nums[i] > nums[i+1] {
                if i == 0 {
                    continue
                } else {
                    for j in i+1..<nums.count {
                        if nums[j] > mini && nums[j] < nums[i] {
                            inversion = i
                            break;
                        }
                    }
                    if inversion != nil {
                        break;
                    }
                }
            }
        }
        return inversion != nil
    }
}

class Solution1 {
    func find132pattern(_ nums: [Int]) -> Bool {
        
        if nums.count < 3 {
            return false
        }
        
        var inversion: Int?, mini = Int.max
        for i in 0..<nums.count-1 {
            mini = min(mini, nums[i])
            if nums[i] > nums[i+1] {
                if i == 0 {
                    continue
                } else {
                    for j in i+1..<nums.count {
                        if nums[j] > mini && nums[j] < nums[i] {
                            inversion = i
                            break;
                        }
                    }
                    if inversion != nil {
                        break;
                    }
                }
            }
        }
        return inversion != nil
    }
}

//print(Solution().find132pattern([3,5,0,3,4]))// true
print(Solution1().find132pattern([-2,1,2,-2,1,2]))// true
//print(Solution().find132pattern([-1, 3, 2, 0]))
//print(Solution().find132pattern([1,0,1,-4,-3]))
