//
//  main.swift
//  1221. 分割平衡字符串
//
//  Created by 徐恩 on 2023/3/31.
//

import Foundation

class Solution {
    func balancedStringSplit(_ s: String) -> Int {
        let L = Character("L")
        var res = 0
        var singleL = 0, singleR = 0
        for ch in s {
            if ch == L {
                singleL += 1
            } else {
                singleR += 1
            }
            if singleR == singleL && singleL != 0 {
                res += 1
                singleR = 0
                singleL = 0
            }
        }
        return res
    }
}

let s = Solution()
assert(s.balancedStringSplit("RLRRLLRLRL") == 4)
assert(s.balancedStringSplit("RLRRRLLRLL") == 2)
assert(s.balancedStringSplit("LLLLRRRR") == 1)
assert(s.balancedStringSplit("RRLRLL") == 1)
print("done")

