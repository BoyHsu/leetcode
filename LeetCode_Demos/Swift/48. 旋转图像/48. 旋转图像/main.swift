//
//  main.swift
//  48. 旋转图像
//
//  Created by ada_PC007 on 2018/6/21.
//  Copyright © 2018年 AdaTech. All rights reserved.
//

import Foundation

class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        let count = matrix.count-1
        for i in 0..<(count+1)/2 {
            for j in 0..<count/2+1 {
                let temp = matrix[i][j]
                matrix[i][j] = matrix[count-j][i]
                matrix[count-j][i] = matrix[count-i][count-j]
                matrix[count-i][count-j] = matrix[j][count-i]
                matrix[j][count-i] = temp
            }
        }
    }
}

var arr: [[Int]] = []

//arr = [
//    [ 5, 1, 9,11],
//    [ 2, 4, 8,10],
//    [13, 3, 6, 7],
//    [15,14,12,16]
//]

arr = [
    [1,2,3],
    [4,5,6],
    [7,8,9]
]

Solution().rotate(&arr)
print(arr)
