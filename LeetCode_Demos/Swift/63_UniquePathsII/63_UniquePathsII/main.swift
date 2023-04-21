//
//  main.swift
//  63_UniquePathsII
//
//  Created by ada_PC007 on 2017/5/10.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        var result = Array(repeating: 0, count: obstacleGrid[0].count)
        result[0] = 1-obstacleGrid[0][0]
        for i in 0..<obstacleGrid.count {
            for j in 0..<obstacleGrid[i].count {
                if obstacleGrid[i][j] == 1 {
                    result[j] = 0
                } else {
                    if j > 0 {
                        result[j] += result[j-1]
                    }
                }
            }
            print(result)
        }
        return result.last!
    }
}

print(Solution().uniquePathsWithObstacles([[0]]))
