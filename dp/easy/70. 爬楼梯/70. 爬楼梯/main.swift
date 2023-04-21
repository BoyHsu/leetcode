//
//  main.swift
//  70. 爬楼梯
//
//  Created by 徐恩 on 2023/3/28.
//

import Foundation

class Solution {
    func climbStairs(_ n: Int) -> Int {
        var last = 1
        var res = 1
        for _ in 1..<n {
            let temp = res
            res += last
            last = temp
        }
        return res
    }
}

let s = Solution()

print(s.climbStairs(2))
print(s.climbStairs(3))
