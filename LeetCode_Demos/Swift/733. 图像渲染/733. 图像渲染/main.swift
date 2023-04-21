//
//  main.swift
//  733. 图像渲染
//
//  Created by ada_PC007 on 2018/6/21.
//  Copyright © 2018年 AdaTech. All rights reserved.
//

import Foundation

class Solution {
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
        var newImage = image
        let oldColor = image[sr][sc]
        let row0 = image.count, col0 = image[0].count
        
        var map = Array(repeating: Array(repeating: false, count: col0), count: row0)
        
        func change(row: Int, col: Int) {
            guard row >= 0 &&
                row < row0 &&
                col >= 0 &&
                col < col0 &&
                image[row][col] == oldColor &&
                !map[row][col]  else {
                return
            }
            map[row][col] = true
            newImage[row][col] = newColor
            change(row: row - 1, col: col)
            change(row: row + 1, col: col)
            change(row: row, col: col - 1)
            change(row: row, col: col + 1)
        }
        
        change(row: sr, col: sc)
        return newImage
    }
}


var arr: [[Int]] = []
//arr = [[1,1,1],
//       [1,1,0],
//       [1,0,1],
//       [1,1,0]]
//print(Solution.init().floodFill(arr, 1, 1, 2))

arr = [[0,0,0],
       [0,1,1]]
print(Solution.init().floodFill(arr, 1, 1, 1))
