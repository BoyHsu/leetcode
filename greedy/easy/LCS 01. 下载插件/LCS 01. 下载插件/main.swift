//
//  main.swift
//  LCS 01. 下载插件
//
//  Created by 徐恩 on 2023/3/31.
//

import Foundation

class Solution {
    func leastMinutes(_ n: Int) -> Int {
        return Int(ceil(log2(Double(n)))) + 1
    }
}

let s = Solution()
//assert(s.leastMinutes(2) == 2)
//assert(s.leastMinutes(4) == 3)
assert(s.leastMinutes(13) == 5)
assert(s.leastMinutes(100000) == 18)
print("done")

