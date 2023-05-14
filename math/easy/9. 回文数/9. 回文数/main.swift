//
//  main.swift
//  9. 回文数
//
//  Created by 徐恩 on 2023/5/14.
//

import Foundation

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 {
            return false
        }
        
        var reversed = 0
        var y = x
        while y > 0 {
            reversed = reversed * 10 + y % 10
            y = y / 10
        }
        return x == reversed
    }
}

let s = Solution()
assert(s.isPalindrome(121) == true)
assert(s.isPalindrome(-121) == false)
assert(s.isPalindrome(0) == true)
assert(s.isPalindrome(10) == false)
print("done")

