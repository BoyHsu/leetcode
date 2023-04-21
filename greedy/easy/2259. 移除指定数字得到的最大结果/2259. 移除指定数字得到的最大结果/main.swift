//
//  main.swift
//  2259. 移除指定数字得到的最大结果
//
//  Created by 徐恩 on 2023/3/31.
//

import Foundation

class Solution {
    func removeDigit(_ number: String, _ digit: Character) -> String {
        var number = Array(number)
        let endIndex = number.count - 1
        var targetIndex = 0
        for i in number.indices {
            let ch = number[i]
            if ch == digit {
                targetIndex = i
                if i != endIndex && ch < number[i+1] {
                    break
                }
            }
        }
        number.remove(at: targetIndex)
        return String(number)
    }
}


let s = Solution()
assert(s.removeDigit("123", "3") == "12")
assert(s.removeDigit("1231", "1") == "231")
assert(s.removeDigit("551", "5") == "51")
assert(s.removeDigit("545", "5") == "54")
assert(s.removeDigit("565", "5") == "65")
print("done")
