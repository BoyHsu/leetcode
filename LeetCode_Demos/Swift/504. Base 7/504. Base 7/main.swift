//
//  main.swift
//  504. Base 7
//
//  Created by ada_PC007 on 2017/5/19.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func convertToBase7(_ num: Int) -> String {
        if num == 0 {
            return "0"
        }
        var r = 0, t = 1
        var n = num > 0 ? num : -num
        
        while n != 0 {
            
            r += t*(n%7)
            t*=10
            n/=7
        }
        if num < 0 {
            r *= -1
        }
        return "\(r)"
    }
}

print(Solution().convertToBase7(-7))
