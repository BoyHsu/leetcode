//
//  main.swift
//  168. Excel Sheet Column Title
//
//  Created by ada_PC007 on 2017/6/16.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func convertToTitle(_ n: Int) -> String {
        var n = n
        var res = ""
        
        while n > 0 {
            var a = n%26
            if a == 0 {
                a = 26
            }
            res.insert(Character(UnicodeScalar(a+64)!), at: res.startIndex)
            n = (n-a)/26
        }
        return res
    }
}

print(Solution().convertToTitle(18954))
