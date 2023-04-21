//
//  main.swift
//  20. Valid Parentheses
//
//  Created by ada_PC007 on 2017/5/17.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func isValid(_ s: String) -> Bool {
        var cs = [UnicodeScalar]()
        var dict = [UnicodeScalar:Bool]()
        dict = ["(": true, "[": true, "{": true, ")": false, "]": false, "}": false]
        
        for i in s.unicodeScalars {
            if dict[i]! {
                cs.append(i)
            } else {
                if let u = cs.popLast() {
                    let dif = Int32(u.value) - Int32(i.value)
                    if abs(dif) > 2 {
                        return false
                    }
                } else {
                    return false
                }
            }
        }
        return cs.isEmpty
    }
}

print(Solution().isValid("([]{}"))
