//
//  main.swift
//  29. 两数相除
//
//  Created by 徐恩 on 2023/5/17.
//

import Foundation

class Solution {
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        if dividend == 0 {
            return 0
        } else if divisor == 1 {
            return dividend
        } else if divisor == -1 {
            if dividend == -(1 << 31) {
                return (1 << 31) - 1
            } else {
                return -dividend
            }
        }
        
        var isPosiRes = true
        var dividend = dividend, divisor = divisor
        if dividend < 0 {
            dividend = -dividend
            isPosiRes.toggle()
        }
        if divisor < 0 {
            divisor = -divisor
            isPosiRes.toggle()
        }
        
        var res = 0
        while dividend >= divisor {
            var temp = divisor
            var shift = 0
            while temp <= dividend {
                temp <<= 1
                shift += 1
            }
            res += (1 << (shift-1))
            dividend -= temp >> 1
        }
        
        return isPosiRes ? res : -res
    }
}

let s = Solution()
assert(s.divide(2, 2) == 1)
assert(s.divide(-2147483648, -3) == 715827882)
print("done")

