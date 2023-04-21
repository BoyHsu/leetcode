//
//  main.swift
//  414_ThirdMaximum Number
//
//  Created by ada_PC007 on 2017/4/20.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func thirdMax(_ nums: [Int]) -> Int {
        var sorted = nums.sorted()
        
        var i = 0
        for j in i ..< sorted.count {
            if sorted[j] != sorted[i] {
                i += 1
                sorted[i] = sorted[j]
            }
        }
        sorted.removeSubrange(i ..< sorted.count)
        
        if sorted.count < 3 {
            return sorted.last!
        }
        return sorted[sorted.count - 3]
    }
}

class Solution1 {
    func thirdMax(_ nums: [Int]) -> Int {
        let set: Set<Int> = Set.init(nums)
        
        let uniqNums = Array.init(set).sorted()
        
        if uniqNums.count < 3 {
            return uniqNums.last!
        }
        return uniqNums[uniqNums.count - 3]
    }
}

let sol = Solution1()
print(sol.thirdMax([3,2,1]))
		
