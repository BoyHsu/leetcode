//
//  main.swift
//  463. 岛屿的周长
//
//  Created by ada_PC007 on 2018/6/20.
//  Copyright © 2018年 AdaTech. All rights reserved.
//

import Foundation

class Solution {
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        let row0 = grid.count
        if row0 == 0 {
            return 0
        }
        let col0 = grid[0].count
        if col0 == 0 {
            return 0
        }
        
        var result = 0
        for (i, arr) in grid.enumerated() {
            for (j, island) in arr.enumerated() {
                if island == 1 {
                    var nearing = 0
                    if i > 0 {
                        if grid[i-1][j] == 1 {
                            nearing += 1
                        }
                    }
                    if i < row0-1 {
                        if grid[i+1][j] == 1 {
                            nearing += 1
                        }
                    }
                    if j > 0 {
                        if grid[i][j-1] == 1 {
                            nearing += 1
                        }
                    }
                    if j < col0-1 {
                        if grid[i][j+1] == 1 {
                            nearing += 1
                        }
                    }
                    result += 4-nearing
                }
            }
        }
        return result
    }
}

