//
//  main.swift
//  448. Find All Numbers Disappeared in an Array
//
//  Created by ada_PC007 on 2017/5/19.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        var map = Array(repeating: 1, count: nums.count)
        for i in nums {
            map[i-1]=0
        }
        
        var result = [Int]()
        
        for i in 0..<nums.count {
            if map[i] == 1 {
                result.append(i+1)
            }
        }
        
        return result
    }
}

