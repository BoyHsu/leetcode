//
//  main.swift
//  342. Power of Four
//
//  Created by ada_PC007 on 2017/6/15.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func isPowerOfFour(_ num: Int) -> Bool {
        if num == 0 {
            return false
        }
        let log = log2(Double(abs(num)))
        if floor(log) == log {
            return Int(log)&1 == 0
        }
        
        return false
    }
}

print(Solution().isPowerOfFour(64))
