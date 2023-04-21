//
//  main.swift
//  233. Number of Digit One
//
//  Created by ada_PC007 on 2017/5/22.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func countDigitOne(_ n: Int) -> Int {
        if n < 2 {
            return max(0, n)
        }
        let bit = Int(floor(log10(Double(n))))
        var r = 0, m = n, f = 1
        
        if bit > 0 {
            var map = [1]
            
            for b in 1..<bit {
                f *= 10
                map.append(map[b-1]*10 + f)
            }
            
            f *= 10
            for i in (0..<map.count).reversed() {
                r += m/f * map[i]
                if m/f > 1 {
                    r += f
                } else if m/f == 1 {
                    r += m%f+1
                } else {
                    f/=10
                    continue
                }
                m %= f
                f/=10
            }
        }
        if m>0 {
            r+=1
        }
        return r
    }
}
//n==223 153 = 20 * 2 + 100 + 10 + 3
//n==123 57 = 20+24 + 10 + 3
//n==1011 316 = 300 + 12 + 4
print(Solution().countDigitOne(1011))
//print(Solution().countDigitOne(123))
