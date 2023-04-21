//
//  main.swift
//  397. Integer Replacement
//
//  Created by ada_PC007 on 2017/7/3.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func integerReplacement(_ n: Int) -> Int {
        
        if n&1 == 1 && n > 1 {
            return 1+min(integerReplacement(n+1), integerReplacement(n-1))
        }
        let log2n = log2(Double(n))
        if log2n == floor(log2n) {
            return Int(log2n)
        }
        return 1+integerReplacement(n>>1)
    }
}

print(Solution().integerReplacement(1))
