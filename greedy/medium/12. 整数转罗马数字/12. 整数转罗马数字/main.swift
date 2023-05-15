//
//  main.swift
//  12. 整数转罗马数字
//
//  Created by 徐恩 on 2023/5/15.
//

import Foundation

class Solution {
    func intToRoman(_ num: Int) -> String {
        var res = ""
        
        res.append(String(repeating: "M", count: num / 1000))// thousands
        
        let hundreds = num % 1000 / 100
        if hundreds <= 3 {
            res.append(String(repeating: "C", count: hundreds))
        } else if hundreds == 4 {
            res.append("CD")
        } else if hundreds <= 8 {
            res.append("D")
            res.append(String(repeating: "C", count: hundreds-5))
        } else if hundreds == 9 {
            res.append("CM")
        }
        
        let tens = num % 100 / 10
        if tens <= 3 {
            res.append(String(repeating: "X", count: tens))
        } else if tens == 4 {
            res.append("XL")
        } else if tens <= 8 {
            res.append("L")
            res.append(String(repeating: "X", count: tens-5))
        } else if tens == 9 {
            res.append("XC")
        }
        
        let ones = num % 10
        if ones <= 3 {
            res.append(String(repeating: "I", count: ones))
        } else if ones == 4 {
            res.append("IV")
        } else if ones <= 8 {
            res.append("V")
            res.append(String(repeating: "I", count: ones-5))
        } else if ones == 9 {
            res.append("IX")
        }
        
        return res
    }
}
