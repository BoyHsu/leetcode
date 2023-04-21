//
//  main.swift
//  264. 丑数 II
//
//  Created by 徐恩 on 2023/3/29.
//

import Foundation

class Solution {
    func nthUglyNumber(_ n: Int) -> Int {
        if n == 1 {
            return 1
        }
        
        var arr = Array(repeating: 1, count: n)
        
        var i2 = 0, i3 = 0, i5 = 0
        for i in 1..<n {
            let n2 = arr[i2] * 2
            let n3 = arr[i3] * 3
            let n5 = arr[i5] * 5
            let n = min(n2, n3, n5)
            arr[i] = n
            if n == n2 {
                i2 += 1
            }
            if n == n3 {
                i3 += 1
            }
            if n == n5 {
                i5 += 1
            }
        }
        
        return arr.last!
    }
}

let s = Solution()
//[1, 2, 3, 4, 5, 6, 8, 9, 10, 12]
//assert(s.nthUglyNumber(2) == 2)
//assert(s.nthUglyNumber(3) == 3)
//assert(s.nthUglyNumber(4) == 4)
//assert(s.nthUglyNumber(5) == 5)
//assert(s.nthUglyNumber(6) == 6)
assert(s.nthUglyNumber(7) == 8)
assert(s.nthUglyNumber(8) == 9)
assert(s.nthUglyNumber(9) == 10)
assert(s.nthUglyNumber(10) == 12)
assert(s.nthUglyNumber(11) == 15)
assert(s.nthUglyNumber(1690) == 2123366400)
assert(s.nthUglyNumber(1) == 1)
