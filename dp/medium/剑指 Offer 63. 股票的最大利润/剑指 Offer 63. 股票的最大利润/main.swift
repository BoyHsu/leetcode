//
//  main.swift
//  剑指 Offer 63. 股票的最大利润
//
//  Created by 徐恩 on 2023/3/29.
//

import Foundation

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var buyPrice = prices.first!, salePrice = buyPrice
        var res = 0
        for price in prices {
            if price < buyPrice {
                let profit = salePrice - buyPrice
                if profit > res {
                    res = profit
                }
                buyPrice = price
                salePrice = price
            } else if price > salePrice {
                salePrice = price
            }
        }
        return max(res, salePrice - buyPrice)
    }
}

let s = Solution()
assert(s.maxProfit([2,4,1]) == 2)
