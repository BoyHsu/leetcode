//
//  main.swift
//  Add to List 238. Product of Array Except Self
//
//  Created by ada_PC007 on 2017/6/12.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var product = 1, mul = 1
        
        for i in nums {
            if i != 0 {
                product *= i
            } else {
                mul -= 1
            }
        }
        if mul < 0 {
            return Array(repeating: 0, count: nums.count)
        }
        
        var res = [Int]()
        for i in nums {
            if i == 0 {
                res.append(product)
            } else {
                res.append(product*mul/i)
            }
        }
        return res
    }
}

class Solution1 {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var product = 1, mul = 1
        
        for i in 0..<nums.count {
            if nums[i] != 0 {
                product *= nums[i]
            } else {
                mul -= 1
            }
        }
        if mul < 0 {
            return Array(repeating: 0, count: nums.count)
        }
        
        var res = [Int]()
        for i in 0..<nums.count {
            if nums[i] == 0 {
                res.append(product)
            } else {
                res.append(product*mul/nums[i])
            }
        }
        return res
    }
}

print(Solution1().productExceptSelf([1,0]))
