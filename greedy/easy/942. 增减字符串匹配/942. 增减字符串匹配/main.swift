//
//  main.swift
//  942. 增减字符串匹配
//
//  Created by 徐恩 on 2023/3/30.
//

import Foundation

class Solution {
    func diStringMatch(_ s: String) -> [Int] {
        var res = Array(repeating: 0, count: s.count+1)
        let s = Array(s)
        var I = 0
        var D = s.count
        for i in s.indices {
            let ch = s[i]
            
            if ch == "D" {
                res[i] = D
                D -= 1
            } else {
                res[i] = I
                I += 1
            }
        }
        res[s.count] = I
        
        return res
    }
}

let s = Solution()
assert(s.diStringMatch("IDID") == [0,4,1,3,2])
assert(s.diStringMatch("III") == [0,1,2,3])
assert(s.diStringMatch("DDI") == [3,2,0,1])
assert(s.diStringMatch("D") == [1,0])
assert(s.diStringMatch("I") == [0,1])
print("done")

