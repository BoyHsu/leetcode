//
//  main.swift
//  1702. 修改后的最大二进制字符串
//
//  Created by 徐恩 on 2023/3/31.
//

import Foundation

class Solution {
    func maximumBinaryString(_ binary: String) -> String {
        var count = 0
        let ch1 = Character("1")
        for ch in binary {
            if ch == ch1 {
                count += 1
            }
        }
        if count < binary.count - 1 {
            var res = Array(repeating: Character("1"), count: binary.count)
            res[res.count - 1 - count] = "0"
            return String(res)
        } else {
            return binary
        }
    }
}

let s = Solution()
assert(s.maximumBinaryString("000110") == "111011")
assert(s.maximumBinaryString("001110") == "110111")
assert(s.maximumBinaryString("01") == "01")
assert(s.maximumBinaryString("11") == "11")
print("done")
