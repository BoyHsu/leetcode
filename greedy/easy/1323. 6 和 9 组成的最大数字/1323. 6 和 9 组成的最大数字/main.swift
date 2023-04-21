//
//  main.swift
//  1323. 6 和 9 组成的最大数字
//
//  Created by 徐恩 on 2023/3/31.
//

import Foundation

class Solution {
    func maximum69Number (_ num: Int) -> Int {
        var units = num % 10
        var mod100 = num % 100
        var tens = mod100 - units
        var hundreds = num % 1000 - mod100
        var thousands = num - hundreds - mod100
        if thousands == 6000 {
            thousands = 9000
        } else if hundreds == 600 {
            hundreds = 900
        } else if tens == 60 {
            tens = 90
        } else if units == 6 {
            units = 9
        }
        return units + tens + hundreds + thousands
    }
}

let s = Solution()
assert(s.maximum69Number(9669) == 9969)
assert(s.maximum69Number(9996) == 9999)
assert(s.maximum69Number(9999) == 9999)
print("done")
