//
//  main.swift
//  200. 岛屿的个数
//
//  Created by ada_PC007 on 2018/6/20.
//  Copyright © 2018年 AdaTech. All rights reserved.
//

import Foundation

class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        let row0 = grid.count
        if row0 == 0 {
            return 0
        }
        let col0 = grid[0].count
        if col0 == 0 {
            return 0
        }
        
        var map = Array(repeating: Array(repeating: false, count: col0), count: row0)
        
        func readAllMap(row: Int, col: Int) {
            if row < 0 || row == row0 || col < 0 || col == col0 || grid[row][col] == "0" || map[row][col] {
                return
            }
            map[row][col] = true
            readAllMap(row: row, col: col-1)
            readAllMap(row: row, col: col+1)
            readAllMap(row: row-1, col: col)
            readAllMap(row: row+1, col: col)
        }
        
        var count = 0
        for (i, arr) in grid.enumerated() {
            for (j, isLand) in arr.enumerated() {
                if isLand == "1" && !map[i][j] {
                    readAllMap(row: i, col: j)
                    count += 1
                }
            }
         }
        return count
    }
}

let ch1: Character = "1"
let ch0: Character = "0"
//let arr = [[ch1,ch1,ch1,ch1,ch0],[ch1,ch1,ch0,ch1,ch0],[ch1,ch1,ch0,ch0,ch0],[ch0,ch0,ch0,ch0,ch0]]

var grid: [[Character]] = []

let count: UInt32 = 10
let _row = Int(arc4random_uniform(count))
let _col = Int(arc4random_uniform(count))

for _ in 0..<_row {
    var tem: [Character] = []
    for _ in 0..<_col {
        tem.append(Character("\(arc4random_uniform(2))"))
    }
    grid.append(tem)
}

for arr in grid {
    var str = ""
    for isLand in arr {
        str.append(isLand)
    }
    print(str)
}

print(Solution.init().numIslands(grid))

