//
//  main.swift
//  507_PerfectNumber
//
//  Created by ada_PC007 on 2017/4/26.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func checkPerfectNumber(_ num: Int) -> Bool {
        var sum = 0
        
        for i in 1..<num {
            if num % i == 0 {
                sum += i
            }
        }
        
        return sum == num
    }
}

class Solution1 {
    func checkPerfectNumber(_ num: Int) -> Bool {
        let n = sqrt(Double(num*2) + 1/4) + 1/2
        if n != round(n) {
            return false
        }
        let logVal = log2(n)
        if logVal != round(logVal) {
            return false
        }
        
        let p = 2 << Int(logVal) - 1
        
        var notPrime = p % 2 == 0
        
        var division = 3
        let limit = Int(sqrt(Double(p)))
        
        while notPrime && division <= limit {
            notPrime = !(p % division == 0)
            division += 2
        }
        return !notPrime && num > 2
    }
}

let sol = Solution1()
print(sol.checkPerfectNumber(1))
//print(sol.checkPerfectNumber(25964951))
