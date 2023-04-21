//
//  main.swift
//  6. N 字形变换
//
//  Created by 徐恩 on 2023/4/1.
//

import Foundation

class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        if numRows == 1 {
            return s
        }
             
        var res = Array(repeating: Character("A"), count: s.count)
        let C = numRows * 2 - 2
        
        var index = 0
        var chIdx = 0
        let chs = Array(s)
        let chsCount = chs.count
        while chIdx < chsCount {
            res[index] = chs[chIdx]
            chIdx += C
            index += 1
        }
        
        for i in 1..<numRows-1 {
            var base = C
            var idx1 = i, idx2 = C-i
            while idx1 < chsCount {
                res[index] = chs[idx1]
                idx1 += base
                index += 1
                if idx2 < chsCount {
                    res[index] = chs[idx2]
                    idx2 += base
                    index += 1
                }
            }
        }
        
        chIdx = numRows-1
        while chIdx < chsCount {
            res[index] = chs[chIdx]
            chIdx += C
            index += 1
        }
        
        return String(res)
    }
}

let s = Solution()
assert(s.convert("A", 1) == "A")
//assert(s.convert("PAYPALISHIRING", 2) == "PYAIHRNAPLSIIG")
assert(s.convert("PAYPALISHIRING", 3) == "PAHNAPLSIIGYIR")
assert(s.convert("PAYPALISHIRING", 4) == "PINALSIGYAHRPI")
assert(s.convert("PAYPALISHIRING", 5) == "PHASIYIRPLIGAN")
print("done")

