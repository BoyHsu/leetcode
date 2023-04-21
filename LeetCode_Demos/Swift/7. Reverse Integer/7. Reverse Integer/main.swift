//
//  main.swift
//  7. Reverse Integer
//
//  Created by ada_PC007 on 2017/5/17.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func reverse(_ x: Int) -> Int {
        if x>1<<32 || -x>1<<32 {
            return 0
        }
        var ori = x, new = 0
        while ori != 0 {
            new = new*10 + ori%10
            ori /= 10
        }
        return new
    }
}

print(Solution().reverse(-123))
