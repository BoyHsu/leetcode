//
//  main.swift
//  495. Teemo Attacking
//
//  Created by ada_PC007 on 2017/6/23.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func findPoisonedDuration(_ timeSeries: [Int], _ duration: Int) -> Int {
        var d = 0, res = 0
        for i in 0 ..< timeSeries.count {
            if timeSeries[i] < d {
                res += timeSeries[i]-timeSeries[i-1]
            } else {
                res += duration
            }
            d = timeSeries[i] + duration
        }
        return res
    }
}

print(Solution().findPoisonedDuration([1,2], 2))
