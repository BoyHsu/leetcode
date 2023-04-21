//
//  main.swift
//  509. 斐波那契数
//
//  Created by 徐恩 on 2023/3/28.
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
            let temp = res
            res += last
            last = temp
        }
        return res
    }
}

let s = Solution()

print(s.fib(2))
print(s.fib(3))
print(s.fib(4))
print(s.fib(5))

