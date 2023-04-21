//
//  main.swift
//  121. 买卖股票的最佳时机
//
//  Created by 徐恩 on 2023/3/28.
//

import Foundation

class Solution {
//    func maxProfit(_ prices: [Int]) -> Int {
//
//    }
    
    func maxProfit(_ prices: [Int]) -> Int {
        var buyPrice = prices.first!, salePrice = buyPrice
        var res = 0
        for i in 1 ..< prices.count {
            let price = prices[i]
            if buyPrice > price {
                let profit = salePrice - buyPrice
                if profit > res {
                    res = profit
                }
                buyPrice = price
                salePrice = price
            } else if salePrice < price {
                salePrice = price
            }
        }
        let profit = salePrice - buyPrice
        if profit > res {
            res = profit
        }
        
        return res
    }
    
    
    
}

let s = Solution()
print(s.maxProfit([7,1,5,3,6,4]))
