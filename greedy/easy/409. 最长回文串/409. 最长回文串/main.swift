//
//  main.swift
//  409. 最长回文串
//
//  Created by 徐恩 on 2023/3/30.
//

import Foundation

class Solution {
    func longestPalindrome(_ s: String) -> Int {
        let A: Character = "A"
        let z: Character = "z"
        let AVal = A.asciiValue!
        var cache = Array(repeating: false, count: Int(z.asciiValue! - AVal + 1))
        var res = 0
        for ch in s {
            let idx = Int(ch.asciiValue! - AVal)
            let exist = cache[idx]
            if exist {
                res += 2
            }
            cache[idx] = !exist
        }
        for val in cache {
            if val {
                res += 1
                break
            }
        }
        return res
    }
}

let s = Solution()
assert(s.longestPalindrome("abccccdd") == 7)
assert(s.longestPalindrome("a") == 1)
assert(s.longestPalindrome("aaaaaccc") == 7)
print("done")
