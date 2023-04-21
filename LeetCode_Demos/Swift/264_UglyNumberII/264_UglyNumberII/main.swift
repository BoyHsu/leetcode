//
//  main.swift
//  264_UglyNumberII
//
//  Created by ada_PC007 on 2017/5/2.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func nthUglyNumber(_ n: Int) -> Int {
        var result = Array(1...6)
        var num = 8
        
        while result.count < n {
            var x = num
            
            for i in 2..<6 {
                while x % i == 0 {
                    x /= i
                }
            }
            if x == 1 {
                result.append(num)
            }
            num += 1
        }
        return result[n-1]
    }
}

class Solution1 {
    func nthUglyNumber(_ n: Int) -> Int {
        var result = Array(1...6)
        var num = 8
        
        while result.count < n {
            for i in [2,3,5] {
                if num % i == 0 {
                    if result.contains(num/i) {
                        result.append(num)
                        break
                    }
                }
            }
            num += 1
        }
        return result[n-1]
    }
}

class Solution2 {
    func nthUglyNumber(_ n: Int) -> Int {
        var dict = [1: true]
        var result = [Int]()
        var i = 1
        
        while result.count < n {
            if dict[i] == true {
                result.append(i)
                for j in [2,3,5] {
                    dict[i * j] = true
                }
            }
            i+=1
        }
        
        return result[n-1]
    }
}

print(Solution2().nthUglyNumber(1690))
