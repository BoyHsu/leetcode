//
//  main.swift
//  2027. 转换字符串的最少操作次数
//
//  Created by 徐恩 on 2023/3/31.
//

import Foundation

class Solution {
    func minimumMoves(_ s: String) -> Int {
        let s = Array(s)
        let O = Character("O")
        var res = 0
        var idx = 0
        let count = s.count
        while idx < count {
            if s[idx] == O {
                idx += 1
            } else {
                idx += 3
                res += 1
            }
        }
        
        return res
    }
}

let s = Solution()
assert(s.minimumMoves("XXX") == 1)
assert(s.minimumMoves("XXOX") == 2)
assert(s.minimumMoves("OOOO") == 0)
assert(s.minimumMoves("XXXX") == 2)
assert(s.minimumMoves("XOXXOXXOOXXOX") == 5)
assert(s.minimumMoves("XOOXOOXOO") == 3)
assert(s.minimumMoves("XOOOXOOXO") == 3)
assert(s.minimumMoves("XOOOXOXOO") == 2)
assert(s.minimumMoves("OOOOXXXOXO") == 2)
assert(s.minimumMoves("XXXOOXXX") == 2)
assert(s.minimumMoves("XXXOOXXXOOXXX") == 3)
assert(s.minimumMoves("XOXXXOOXXXOOXXX") == 4)
print("done")
