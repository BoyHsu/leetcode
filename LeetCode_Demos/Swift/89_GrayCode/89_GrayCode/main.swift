//
//  main.swift
//  89_GrayCode
//
//  Created by ada_PC007 on 2017/4/25.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation


class Solution {
    func grayCode(_ n: Int) -> [Int] {
        var result = [0]
        
        for i in 0..<n {
            let plus = 1 << i
            
            for j in result.reversed() {
                result.append(j + plus)
            }
        }
        
        return result
    }
}

class Solution1 {
    func grayCode(_ n: Int) -> [Int] {
        var result = Array(repeating: 0, count: 1 << n)
        var c = 1
        
        for i in 0..<n {
            let plus = 1 << i
            
            for j in (0..<c).reversed() {
                result[c] = result[j] + plus
                c += 1
            }
        }
        
        return result
    }
}

let sol = Solution1()
print(sol.grayCode(3))
