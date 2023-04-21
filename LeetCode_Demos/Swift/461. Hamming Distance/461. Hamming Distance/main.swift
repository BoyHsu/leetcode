//
//  main.swift
//  461. Hamming Distance
//
//  Created by ada_PC007 on 2017/6/14.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func hammingDistance(_ x: Int, _ y: Int) -> Int {
        var res = 0, a = x, b = y
        
        while a != 0 || b != 0 {
            if a&1 != b&1 {
                res += 1
            }
            a >>= 1;b >>= 1
        }
        return res
    }
}

print(Solution().hammingDistance(1, 4))
print(log2(exp(9.0)))
