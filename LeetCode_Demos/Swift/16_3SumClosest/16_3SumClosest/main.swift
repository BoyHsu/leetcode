//
//  main.swift
//  16_3SumClosest
//
//  Created by ada_PC007 on 2017/5/8.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        let s = nums.sorted()
        
        var min = Int.max
        var minDif = Int.max
        
        
        for i in 0 ..< s.count-2 {
            for j in i+1 ..< s.count-1 {
                for k in j+1 ..< s.count {
                    let sum = s[i]+s[j]+s[k]
                    let dif = Int(abs(Int32(sum - target)))
                    
                    if minDif > dif {
                        minDif = dif
                        min = sum
                        print(i,j,k)
                    }
                }
            }
        }
        print(s)
        return min
    }
}

//class Solution1 {
//    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
//        let s = nums.sorted()
//        
//        if target > 3*s[s.count-3] {
//            return s[s.count-1] + s[s.count-2] + s[s.count-3]
//        }
//        if target < 3*s[2] {
//            return s[0] + s[1] + s[2]
//        }
//        
//    }
//}

print(Solution().threeSumClosest([1,3,7,5,13], 22))
