//
//  main.swift
//  8. String to Integer (atoi)
//
//  Created by ada_PC007 on 2017/5/17.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func myAtoi(_ str: String) -> Int {
        if str.characters.count == 0 {
            return 0
        }
        if str == "-" || str == "+" {
            return 0
        }
        let intStr = Int(str)!
        if intStr > Int(Int32.max) {
            return Int(Int32.max)
        }
        
        if intStr < Int(Int32.min) {
            return Int(Int32.min)
        }
        
        return intStr
    }
}

print(Solution().myAtoi(""))
