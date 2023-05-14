//
//  main.swift
//  7. 整数反转
//
//  Created by 徐恩 on 2023/5/14.
//

import Foundation

class Solution {
    func reverse(_ x: Int) -> Int {
        let isPosi = x > 0
        let max = (1 << 31) - (isPosi ? 1 : 0)
        let maxDivide10 = max / 10
        var res = 0
        var x = isPosi ? x : -x
        while x > 0 {
            if res > maxDivide10 {
                return -1
            }
            
            res = res * 10 + x % 10
            x = x/10
        }
        return isPosi ? res : -res
    }
}

let s = Solution()
assert(s.reverse(2147447412) == 2147447412)
assert(s.reverse(123) == 321)
assert(s.reverse(-123) == -321)
assert(s.reverse(2147447412) == 2147447412)
assert(s.reverse(2147483647) == -1)
assert(s.reverse(-2147483648) == -1)
print("done")

