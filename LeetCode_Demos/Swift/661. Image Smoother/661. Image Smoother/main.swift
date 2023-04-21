//
//  main.swift
//  661. Image Smoother
//
//  Created by ada_PC007 on 2017/9/4.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func imageSmoother(_ M: [[Int]]) -> [[Int]] {
        var res = Array(M)
        let rowN = M.count, colN = M[0].count
        
        for i in 0..<rowN {
            for j in 0..<colN {
                var sum = 0, cnt = 0
                for n in i-1...i+1 {
                    for m in j-1...j+1 {
                        if 0 > m || 0 > n || m == colN || n == rowN {
                            continue
                        }
                        sum += M[n][m]
                        cnt += 1
                    }
                }
                res[i][j] = sum/cnt
            }
        }
        return res
    }
}

