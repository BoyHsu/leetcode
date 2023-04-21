//
//  main.swift
//  268. 缺失数字
//
//  Created by ada_PC007 on 2018/6/21.
//  Copyright © 2018年 AdaTech. All rights reserved.
//

import Foundation

class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        var count = nums.count, res = count*(count+1)/2
        for num in nums {
            res -= num
        }
        return res
    }
}


var arr: [Int] = []

arr = [3,0,1]

print(Solution().missingNumber(arr))
