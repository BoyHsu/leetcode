//
//  main.swift
//  66_PlusOne
//
//  Created by ada_PC007 on 2017/4/20.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var result = digits
        result[result.count - 1] += 1
        
        var shouldInsert = false
        
        for i in (0 ..< result.count).reversed() {
            let val = result[i]
            if val >= 10 {
                result[i] = val % 10
                if i - 1 < 0 {
                    shouldInsert = true
                } else {
                    result[i - 1] += 1
                }
            } else {
                break
            }
        }
        if shouldInsert {
            result.insert(1, at: 0)
        }
        return result
    }
}

class Solution1 {
    func plusOne(_ digits: [Int]) -> [Int] {
        var result = digits
        
        var shouldPlus = true
        
        for i in (0 ..< result.count).reversed() {
            let val = result[i]
            if shouldPlus {
                if val < 9 {
                    result[i] = val + 1
                    shouldPlus = false
                    break
                } else {
                    result[i] = 0
                }
            }
        }
        if shouldPlus {
            result.insert(1, at: 0)
        }
        return result
    }
}

let sol = Solution()
print(sol.plusOne([9,9,9,9]))
