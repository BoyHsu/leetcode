//
//  main.swift
//  566. Reshape the Matrix
//
//  Created by ada_PC007 on 2017/9/4.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func matrixReshape(_ nums: [[Int]], _ r: Int, _ c: Int) -> [[Int]] {
        if nums.isEmpty || nums.count * nums[0].count != r*c {
            return nums
        }
        let c0 = nums[0].count
        var idx = 0
        var N = Array(repeating: Array(repeating: 0, count: c), count: r)
        
        while idx < r*c {
            N[idx/c][idx%c] = nums[idx/c0][idx%c0]
            idx += 1
        }
        return N
    }
}

class Solution1 {
    func matrixReshape(_ nums: [[Int]], _ r: Int, _ c: Int) -> [[Int]] {
        if nums.isEmpty || nums.count * nums[0].count != r*c {
            return nums
        }
        let c0 = nums[0].count
        var idx = 0
        var N = [[Int]](), t = [Int]()
        
        while idx < r*c {
            t.append(nums[idx/c0][idx%c0])
            if idx % c == c-1 {
                N.append(t)
                t = []
            }
            idx += 1
        }
        return N
    }
}

print(Solution().matrixReshape([[1,2], [3,4]], 1, 4))
