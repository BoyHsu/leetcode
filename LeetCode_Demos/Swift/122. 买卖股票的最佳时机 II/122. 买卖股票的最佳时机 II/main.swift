//
//  main.swift
//  122. 买卖股票的最佳时机 II
//
//  Created by ada_PC007 on 2018/6/21.
//  Copyright © 2018年 AdaTech. All rights reserved.
//

import Foundation
/*
 
 s1: 1,2,3,4,5,6
 s2: 6,5,4,3,2,1
 s3: 3,1,4,6,5,2
 
 */
 
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 0 else {
            return 0
        }
        var lo = 0, hi = lo
        var max = 0
        
        for i in 1..<prices.count {
            if prices[i-1] > prices[i] {
                if i-1 == hi {
                    max += prices[hi]-prices[lo]
                }
                lo = i
            }
            if prices[i-1] <= prices[i] {
                hi = i
            }
        }
        if hi == prices.count-1 {
            max += prices[hi]-prices[lo]
        }
        return max
    }
}

var arr: [Int] = []
//arr = [1,2,3,4,5,6]
//arr = [7,1,5,3,6,4]
//arr = [6,5,4,3,2,1]
arr = [5,2,3,2,6,6,2,9,1,0,7,4,5,0]

print(Solution().maxProfit(arr))
