//
//  main.swift
//  171. Excel Sheet Column Number
//
//  Created by ada_PC007 on 2017/6/16.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func titleToNumber(_ s: String) -> Int {
        var res = 0
        
        for i in s.unicodeScalars {
            res = res * 26 + Int(i.value-64)
        }
        return res
    }
}

print(Solution().titleToNumber("AZZ"))
