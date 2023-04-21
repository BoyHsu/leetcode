//
//  main.swift
//  67_AddBinary
//
//  Created by ada_PC007 on 2017/4/20.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        var result = String()
        
        let aChars = a.characters
        let bChars = b.characters
        var shouldPlus = false
        
        for i in 0 ..< max(aChars.count, bChars.count) {
            let aVal: Int = (i<aChars.count) ? Int(String(a[a.index(a.endIndex, offsetBy: -1-i)]))! : 0
            let bVal: Int = (i<bChars.count) ? Int(String(b[b.index(b.endIndex, offsetBy: -1-i)]))! : 0
            let c = shouldPlus ? 1 : 0
            
            let sum = aVal + bVal + c
            
            shouldPlus = sum > 1
            
            result = result.appending(String(sum & 1))
        }
        if shouldPlus {
            result = result.appending("1")
        }
        return String.init(result.characters.reversed())
    }
}

class Solution1 {
    func addBinary(_ a: String, _ b: String) -> String {
        var sum = Int(a)! + Int(b)!
        var digit = 1
        
        while digit <= sum {
            let quo = sum / digit % 10
            
            if quo > 1 {
                sum = sum - 2 * digit + 10 * digit
            }
            
            digit *= 10
        }
        
        return "\(sum)"
    }
}

class Solution2 {
    func addBinary(_ a: String, _ b: String) -> String {
        let count = max(a.unicodeScalars.count, b.unicodeScalars.count)
        var chars = Array(repeating: Character("0"), count: count)
        var needPlus = false
        
        for i in 0 ..< count {
            let ai = a.index(a.endIndex, offsetBy: -1-i, limitedBy: a.startIndex)?.samePosition(in: a.unicodeScalars)
            let bi = b.index(b.endIndex, offsetBy: -1-i, limitedBy: b.startIndex)?.samePosition(in: b.unicodeScalars)
            
            let aVal: Int = i < a.unicodeScalars.count ? Int(a.unicodeScalars[ai!].value - 48) : 0
            let bVal: Int = i < b.unicodeScalars.count ? Int(b.unicodeScalars[bi!].value - 48) : 0
            
            let sum = aVal + bVal + (needPlus ? 1 : 0)
            needPlus = sum > 1
            
            chars[count - 1 - i] = Character("\(sum&1)")
        }
        if needPlus {
            chars.insert(Character("1"), at: 0)
        }
        return String(chars)
    }
}

class Solution3 {
    func addBinary(_ a: String, _ b: String) -> String {
        let aNums = a.unicodeScalars.flatMap{Int($0.value)-48}
        let bNums = b.unicodeScalars.flatMap{Int($0.value)-48}
        
        let aLonger = aNums.count > bNums.count
        var resultNum = aLonger ? aNums : bNums
        var addArr = Array(repeating: 0, count: max(aNums.count, bNums.count))
        let ori = Int(abs(Int32(aNums.count - bNums.count)))
        let shortArr = aLonger ? bNums : aNums
        
        for i in ori ..< addArr.count {
            addArr[i] = shortArr[i - ori]
        }
        
        var needPlus = false
        
        for i in 0 ..< addArr.count {
            let ri = resultNum.count - 1 - i
            let ai = addArr.count - 1 - i
            
            let sum = resultNum[ri] + addArr[ai] + (needPlus ? 1 : 0)
            
            needPlus = sum > 1
            
            resultNum[ri] = sum & 1
        }
        if needPlus {
            resultNum.insert(1, at: 0)
        }
        var str = ""
        
        for i in resultNum {
            str += "\(i)"
        }
        
        return str
    }
}

let sol = Solution3()

print(sol.addBinary("10100000100100110110010000010101111011011001101110111111111101000000101111001110001111100001101", "10"))

