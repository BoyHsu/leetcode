//
//  main.swift
//  442. Find All Duplicates in an Array
//
//  Created by ada_PC007 on 2017/6/15.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func findDuplicates(_ nums: [Int]) -> [Int] {
        var s: Set<Int> = []
        var res = [Int]()
        
        for i in nums {
            if !s.insert(i).inserted {
                res.append(i)
            }
        }
        return res
    }
}

class Solution1 {
    func findDuplicates(_ nums: [Int]) -> [Int] {
        var s = [Int: Bool]()
        var res = [Int]()
        
        for i in nums {
            if s[i] == nil {
                s[i] = true
            } else {
                res.append(i)
            }
        }
        return res
    }
}

class Solution2 {
    func findDuplicates(_ nums: [Int]) -> [Int] {
        let nums = nums.sorted()
        var res = [Int]()
        var i = 0, j = 1
        
        while j < nums.count {
            if nums[i] != nums[j] {
                if j-i != 1 {
                    res.append(nums[i])
                }
                i = j
            }
            j+=1
        }
        if j-i != 1 {
            res.append(nums[i])
        }
        return res
    }
}
