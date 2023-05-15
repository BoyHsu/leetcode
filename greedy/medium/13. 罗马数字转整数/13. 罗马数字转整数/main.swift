//
//  main.swift
//  13. 罗马数字转整数
//
//  Created by 徐恩 on 2023/5/15.
//

import Foundation

class Solution {
    func romanToInt(_ s: String) -> Int {
        guard !s.isEmpty else { return 0 }
        let map: [Character: Int] = [
            "I": 1,
            "V": 5,
            "X": 10,
            "L": 50,
            "C": 100,
            "D": 500,
            "M": 1000
        ]
        var res = 0
        var last = Int.max
        for ch in s {
            let v = map[ch] ?? 0
            res += v
            if v > last {
                res -= 2*last
            }
            
            last = v
        }
        return res
    }
}


