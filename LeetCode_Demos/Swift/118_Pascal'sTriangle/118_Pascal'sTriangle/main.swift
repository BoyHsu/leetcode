//
//  main.swift
//  118_Pascal'sTriangle
//
//  Created by ada_PC007 on 2017/4/25.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        var result = [[Int]]()
        
        for i in 0..<numRows {
            var row = [Int]()
            
            for j in 0...i {
                if 0 == j || i == j {
                    row.append(1)
                } else {
                    row.append(result[i-1][j-1] + result[i-1][j])
                }
            }
            result.append(row)
        }
        return result
    }
}

class Solution1 {
    func generate(_ numRows: Int) -> [[Int]] {
        var result = [[Int]]()
        
        for i in 0..<numRows {
            var row = Array(repeating: 1, count: i+1)
            
            for j in 0...i {
                if 0 != j && i != j {
                    row[j] = result[i-1][j-1] + result[i-1][j]
                }
            }
            result.append(row)
        }
        return result
    }
}

let sol = Solution1()

print(sol.generate(5))
