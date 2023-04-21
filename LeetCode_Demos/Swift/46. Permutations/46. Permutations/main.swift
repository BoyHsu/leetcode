//
//  main.swift
//  46. Permutations
//
//  Created by ada_PC007 on 2017/5/18.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {//迭代
    func permute(_ nums: [Int]) -> [[Int]] {
        var result = [[nums[0]]]
        
        for i in 1..<nums.count {
            for _ in 0..<result.count {
                let a = result.remove(at: 0)
                for j in 0...a.count {
                    var b = a
                    b.insert(nums[i], at: j)
                    result.append(b)
                }
            }
        }
        return result
    }
}

class Solution1 {//递归
    func permute(_ nums: [Int]) -> [[Int]] {
        var result = [[nums[0]]]
        
        
        return result
    }
}

print(Solution1().permute([0,3,2]))
