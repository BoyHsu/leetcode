//
//  main.swift
//  59. Spiral Matrix II
//
//  Created by ada_PC007 on 2017/6/22.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func generateMatrix(_ n: Int) -> [[Int]] {
        var res = Array(repeating: Array(repeating: 0, count: n), count: n)
        var i = 0, j = 0
        
        while j < (n-1)>>1  {
            for k in j...n-j-1 {
                i += 1
                res[j][k] = i
            }
            for k in j+1...n-j-1 {
                i += 1
                res[k][n-j-1] = i
            }
            for k in (j...n-j-2).reversed() {
                i+=1
                res[n-j-1][k] = i
            }
            for k in (j+1...n-j-2).reversed() {
                i+=1
                res[k][j] = i
            }
            j+=1
        }
        for k in i+1...n*n {
            res[(k-i-1)>>1 + j][j + ((k-i-1)%3+1) >> 1] = k
        }
        return res
    }
}

print(Solution().generateMatrix(4))
