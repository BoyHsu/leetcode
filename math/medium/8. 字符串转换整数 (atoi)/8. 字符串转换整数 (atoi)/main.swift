//
//  main.swift
//  8. 字符串转换整数 (atoi)
//
//  Created by 徐恩 on 2023/5/14.
//

import Foundation

class Solution {
    func myAtoi(_ s: String) -> Int {
        let chs = Array(s)
        var numIdx = 0
        while numIdx < chs.count, chs[numIdx] == " " {
            numIdx += 1
        }
        
        if numIdx == chs.count {
            return 0
        }
        
        var isPosi = true
        if chs[numIdx] == "+" {
            numIdx += 1
        } else if chs[numIdx] == "-" {
            isPosi = false
            numIdx += 1
        }
        
        var res = 0
        let upper = 1 << 31 - (isPosi ? 1 : 0)
        while numIdx < chs.count, chs[numIdx].isWholeNumber {
            res = res * 10 + chs[numIdx].wholeNumberValue!
            numIdx += 1
            if res > upper {
                res = upper
                break
            }
        }
        return isPosi ? res : -res
    }
}

let s = Solution()
assert(s.myAtoi("") == 0)
assert(s.myAtoi("42") == 42)
assert(s.myAtoi("-42") == -42)
assert(s.myAtoi("+42") == 42)
assert(s.myAtoi("   +42") == 42)
assert(s.myAtoi("words and 987") == 0)
print("done")

