//
//  main.swift
//  剑指 Offer 10- I. 斐波那契数列
//
//  Created by 徐恩 on 2023/3/29.
//

import Foundation

class Solution {
    func fib(_ n: Int) -> Int {
        if n == 0 {
            return 0
        } else if n == 1 {
            return 1
        }
        
        var last = 0
        var res = 1
        for _ in 2...n {
            let new = last + res
            last = res
            res = new % 1000000007
        }
        return res
    }
}

let s = Solution()
assert(s.fib(2) == 1)
assert(s.fib(5) == 5)
assert(s.fib(30) == 832040)
assert(s.fib(100) == 687995182)
print("done")
