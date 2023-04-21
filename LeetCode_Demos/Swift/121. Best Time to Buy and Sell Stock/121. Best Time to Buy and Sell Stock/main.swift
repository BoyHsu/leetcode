//
//  main.swift
//  121. Best Time to Buy and Sell Stock
//
//  Created by ada_PC007 on 2017/8/29.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.count < 2 {
            return 0
        }

        var lastIsInv = false
        var res = 0, lo = 0, hi = 0
        
        for i in 0..<prices.count-1 {
            let isInversion = prices[i] > prices[i+1]
            if !lastIsInv && isInversion {
                if prices[i] > prices[hi] {
                    hi = i
                    res = max(res, prices[hi]-prices[lo])
                }
            } else if lastIsInv && !isInversion {
                if prices[i] < prices[lo] {
                    lo = i
                    hi = i
                }
            }
            lastIsInv = isInversion
        }
        
        res = max(res, prices.last! - prices[lo])
        
        return res
    }
}
//[7,1,5,3,6,4]

print(Solution().maxProfit([6,1,3,2,4,7]))

