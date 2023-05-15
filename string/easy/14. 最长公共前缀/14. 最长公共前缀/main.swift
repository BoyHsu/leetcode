//
//  main.swift
//  14. 最长公共前缀
//
//  Created by 徐恩 on 2023/5/15.
//

import Foundation

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        let res = Array(strs.first!)
        var resLen = res.count
        for i in 1..<strs.count {
            let str = Array(strs[i])
            var idx = 0
            let upper = min(resLen, str.count)
            while idx < upper, str[idx] == res[idx] {
                idx += 1
            }
            resLen = idx
        }
        
        return String(res[0..<resLen])
    }
}

let s = Solution()
assert(s.longestCommonPrefix(["flower","flow","flight"]) == "fl")
assert(s.longestCommonPrefix(["aaaaaaaaaaaaaaa","aaaa","a"]) == "a")
assert(s.longestCommonPrefix(["aaaaaaaaaaaaaaa","aaaa"]) == "aaaa")
assert(s.longestCommonPrefix(["cir","car"]) == "c")
print("done")

