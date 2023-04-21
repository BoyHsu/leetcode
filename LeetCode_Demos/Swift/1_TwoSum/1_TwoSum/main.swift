//
//  main.swift
//  1_TwoSum
//
//  Created by ada_PC007 on 2017/5/3.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var res = [Int]()
        
        for i in 0..<nums.count-1 {
            for j in i+1..<nums.count {
                if nums[i] + nums[j] == target {
                    res = [i,j]
                    break
                }
            }
        }
        return res
    }
}

class Solution1 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        
    }
}
