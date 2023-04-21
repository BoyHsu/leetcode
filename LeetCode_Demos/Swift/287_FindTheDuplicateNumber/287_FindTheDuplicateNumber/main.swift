//
//  main.swift
//  287_FindTheDuplicateNumber
//
//  Created by ada_PC007 on 2017/5/12.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        var maps: Set<Int> = []
        var ans = 0
        for i in nums {
            if !maps.insert(i).inserted {
                ans = i
                break;
            }
        }
        return ans
    }
}

class Solution1 {
    func findDuplicate(_ nums: [Int]) -> Int {
        var maps = [Int: Bool]()
        var ans = 0
        for i in nums {
            if maps[i] != nil {
                ans = i
                break;
            } else {
                maps[i] = true
            }
        }
        return ans
    }
}

class Solution2 {
    func findDuplicate(_ nums: [Int]) -> Int {
        var maps = Array(repeating: false, count: nums.count)
        var ans = 0
        for i in nums {
            if maps[i] == false {
                maps[i] = true
            } else {
                ans = i
                break
            }
        }
        return ans
    }
}

class Solution3 {
    func findDuplicate(_ nums: [Int]) -> Int {
        var ans = 0, i = 0
        let n = nums.sorted()
        
        while i < n.count-1 {
            if n[i] == n[i+1] {
                ans = n[i]
                break
            }
            i+=1
        }
        
        return ans
    }
}
