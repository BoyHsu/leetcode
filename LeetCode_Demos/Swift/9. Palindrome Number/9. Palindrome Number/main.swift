//
//  main.swift
//  9. Palindrome Number
//
//  Created by ada_PC007 on 2017/5/23.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        var f = 1, y = 0
        if x>0 { y = x} else { return false}
        var res = true
        
        while y/f >= 10 {f*=10}
        while f>=10 {
            let a = y/f, b = y%10
            res = a == b
            if !res {
                break
            }
            y%=f
            y/=10
            f/=100
        }
        return res
    }
}

class Solution1 {
    func isPalindrome(_ x: Int) -> Bool {
        if x<0 {
            return false
        }
        var y = x
        var l = [Int]()
        while y>0 {
            l.append(y%10)
            y/=10
        }
        var lo = 0, hi = l.count-1
        var res = true
        while lo<hi {
            res = l[lo] == l[hi]
            if !res {
                break
            }
            lo += 1
            hi -= 1
        }
        return res
    }
}

print(Solution1().isPalindrome(10))
