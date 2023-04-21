//
//  main.swift
//  136_SingleNumber
//
//  Created by ada_PC007 on 2017/5/12.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var s = nums.sorted()
        s.append(Int.max)
        
        var ans = 0, i = 0, j = 1
        
        while j<s.count {
            if s[i] != s[j] {
                if j-i == 1 {
                    ans = s[i]
                    break
                }
                i=j
            }
            j+=1
        }
        return ans
    }
}

print(Solution().singleNumber([3,2,5,2,3]))
