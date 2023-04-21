//
//  main.swift
//  338. 比特位计数
//
//  Created by 徐恩 on 2023/3/28.
//

import Foundation

class Solution {
    func countBits(_ n: Int) -> [Int] {
        if n == 0 {
            return [0]
        } else if n == 1 {
            return [0, 1]
        }
        var res = Array.init(repeating: 0, count: n+1)
        for var i in 1...n {
            if res[i] == 0 {
                let val = res[i-1] + 1
                while i <= n {
                    res[i] = val
                    i *= 2
                }
            }
        }
        return res
    }
}

let s = Solution()
print(s.countBits(2))
print(s.countBits(5))
