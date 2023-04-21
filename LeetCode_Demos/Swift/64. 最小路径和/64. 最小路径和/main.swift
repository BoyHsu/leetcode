//
//  main.swift
//  64. 最小路径和
//
//  Created by ada_PC007 on 2018/6/21.
//  Copyright © 2018年 AdaTech. All rights reserved.
//

import Foundation

class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        var dp = grid[0]
        for i in 1..<dp.count {
            dp[i] += dp[i-1]
        }
        for i in 1..<grid.count {
            for j in 0..<grid[0].count {
                var min = dp[j]
                if j > 0 {
                    if dp[j-1] < min {
                        min = dp[j-1]
                    }
                }
                dp[j] = grid[i][j] + min
            }
        }
        return dp.last!
    }
}

var arr: [[Int]] = []
arr = [
    [1,3,1],
    [1,5,1],
    [4,2,1]
]

print(Solution().minPathSum(arr))
