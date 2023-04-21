//
//  main.swift
//  680. 验证回文串 II
//
//  Created by 徐恩 on 2023/3/30.
//

import Foundation

class Solution {
    func validPalindrome(_ s: String) -> Bool {
        let res = _validPalindrome(Array(s), 0, s.count-1, false)
        return res
    }
    
    func _validPalindrome(_ s: [Character], _ l: Int, _ r: Int, _ valided: Bool) -> Bool {
        if l == r {
            return true
        }
        var l = l, r = r
        
        while l < r {
            let chl = s[l]
            let chr = s[r]
            if chl != chr {
                if valided {
                    return false
                } else {
                    return _validPalindrome(s, l+1, r, true) || _validPalindrome(s, l, r-1, true)
                }
            }
            l+=1
            r-=1
        }
        return true
    }
}

let s = Solution()
//assert(s.validPalindrome("yd") == true)
//assert(s.validPalindrome("aba") == true)
//assert(s.validPalindrome("abca") == true)
//assert(s.validPalindrome("abc") == false)
//assert(s.validPalindrome("aabbc") == false)
//assert(s.validPalindrome("tebbem") == false)

let count = 100000 / 2

var str = String()
for _ in 0...count {
    let num = Int(arc4random_uniform(25)) + Int(Character("a").asciiValue!)
    str.append(String(Character(UnicodeScalar(num)!)))
}
let str1 = str.reversed()

print(s.validPalindrome(str + "bd" + str1))
print(s.validPalindrome(str + "bcd" + str1))

print("done")


