//
//  main.swift
//  120_Triangle
//
//  Created by ada_PC007 on 2017/4/26.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        var result = [Int]()
        
        recursion(&result, triangle, 0, 0, 0)
        return result.min()!
    }
    
    func recursion(_ result: inout [Int], _ nums: [[Int]], _ row: Int, _ index: Int, _ sum: Int) {
        if row == nums.count - 1 {
            result.append(sum + nums[row][index])
            return
        }
        recursion(&result, nums, row+1, index, sum + nums[row][index])
        recursion(&result, nums, row+1, index+1, sum + nums[row][index])
    }
}

class Solution1 {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        var result = [Int]()
        
        recursion(&result, triangle, 0, 0, 0)
        return result.min()!
    }
    
    func recursion(_ result: inout [Int], _ nums: [[Int]], _ row: Int, _ index: Int, _ sum: Int) {
        if row == nums.count - 1 {
            result.append(sum + nums[row][index])
            return
        }
        recursion(&result, nums, row+1, index, sum + nums[row][index])
        recursion(&result, nums, row+1, index+1, sum + nums[row][index])
    }
}

class Solution2 {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        var result = [Int]()
        
        recursion(&result, triangle, 0, 0, 0)
        print(result)
        return result.min()!
    }
    
    func recursion(_ result: inout [Int], _ nums: [[Int]], _ row: Int, _ index: Int, _ sum: Int) {
        if row == nums.count - 2 {
            result.append(sum + nums[row][index] + min(nums[row+1][index], nums[row+1][index+1]))
            return
        }
        recursion(&result, nums, row+1, index, sum + nums[row][index])
        recursion(&result, nums, row+1, index+1, sum + nums[row][index])
    }
}

class Solution3 {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        var s = triangle
        
        for i in (0 ..< triangle.count-1).reversed() {
            for j in 0 ... i {
//                s[i][j] += min(s[i+1][j], s[i+1][j+1])
                s[i+1][j] > s[i+1][j+1] ? (s[i][j] += s[i+1][j+1]) : (s[i][j] += s[i+1][j])
            }
        }
        return s[0][0]
    }
}

let sol = Solution1()
/*13*/
print(sol.minimumTotal([
         [2],
        [3,4],
       [6,5,7],
      [4,1,8,-1],
     [4,6,8,3,1],
    [4,6,8,3,1,0]
    ]))
