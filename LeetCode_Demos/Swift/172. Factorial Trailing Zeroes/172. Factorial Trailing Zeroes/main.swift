//
//  main.swift
//  172. Factorial Trailing Zeroes
//
//  Created by ada_PC007 on 2017/5/22.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func trailingZeroes(_ n: Int) -> Int {
        var res = 0, m = n
        
        while m != 0 {
            m/=5
            res += m
        }
        return res
    }
}

print(Solution().trailingZeroes(50))
