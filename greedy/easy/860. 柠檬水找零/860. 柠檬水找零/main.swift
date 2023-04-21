//
//  main.swift
//  860. 柠檬水找零
//
//  Created by 徐恩 on 2023/3/30.
//

import Foundation

class Solution {
    func lemonadeChange(_ bills: [Int]) -> Bool {
        var c10 = 0, c5 = 0
        for bill in bills {
            switch bill {
            case 5:
                c5 += 1
            
            case 10:
                if c5 > 0 {
                    c5 -= 1
                    c10 += 1
                } else {
                    return false
                }
            
            case 20:
                if c10 > 0, c5 > 0 {
                    c10 -= 1
                    c5 -= 1
                } else if c5 >= 3 {
                    c5 -= 3
                } else {
                    return false
                }
            
            default: break
            }
        }
        return true
    }
}

let s = Solution()
assert(s.lemonadeChange([5,5,5,10,20]) == true)
assert(s.lemonadeChange([5,5,10,10,20]) == false)
print("done")
