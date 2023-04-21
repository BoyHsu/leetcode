//
//  main.swift
//  695. 岛屿的最大面积
//
//  Created by ada_PC007 on 2018/6/20.
//  Copyright © 2018年 AdaTech. All rights reserved.
//

import Foundation

class Solution {
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        let row0 = grid.count, col0 = grid[0].count
        guard grid.count > 0, grid[0].count > 0 else {
            return 0
        }
        
        var map = Array(repeating: Array(repeating: false, count: grid[0].count), count: grid.count)
        
        func calculate(row: Int, col: Int) -> Int {
            if row >= row0 ||
                row < 0 ||
                col >= col0 ||
                col < 0 ||
                grid[row][col] == 0 ||
                map[row][col] {
                return 0
            }
            map[row][col] = true
            return 1 +
                calculate(row: row, col: col-1) +
                calculate(row: row, col: col+1) +
                calculate(row: row-1, col: col) +
                calculate(row: row+1, col: col)
        }
        
        var max = 0
        for i in 0..<grid.count {
            let arr = grid[i]
            for (j, isLand) in arr.enumerated() {
                if isLand == 1 && map[i][j] == false {
                    let c = calculate(row: i, col: j)
                    if c > max {
                        max = c
                    }
                }
            }
        }
        
        return max
    }
}

//let arr = [[0,0,1,0,0,0,0,1,0,0,0,0,0],
//           [0,0,0,0,0,0,0,1,1,1,0,0,0],
//           [0,1,1,0,1,0,0,0,0,0,0,0,0],
//           [0,1,0,0,1,1,0,0,1,0,1,0,0],
//           [0,1,0,0,1,1,0,0,1,1,1,0,0],
//           [0,0,0,0,0,0,0,0,0,0,1,0,0],
//           [0,0,0,0,0,0,0,1,1,1,0,0,0],
//           [0,0,0,0,0,0,0,1,1,0,0,0,0]]

let arr = [[0,1],[1,1]]

print(Solution.init().maxAreaOfIsland(arr))
