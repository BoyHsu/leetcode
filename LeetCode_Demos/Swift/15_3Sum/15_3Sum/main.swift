//
//  main.swift
//  15_3Sum
//
//  Created by ada_PC007 on 2017/5/5.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        
        let s = nums.sorted()
        var i = 0
        print(s)
        while i < s.count-2 {
            var lo = i+1, hi = s.count-1
            while lo<hi {
                let sum = s[i] + s[lo] + s[hi]
                
                if sum > 0 {
                    hi -= 1
                } else if sum < 0 {
                    lo += 1
                } else {
                    result.append([s[i], s[lo], s[hi]])
                    
                    while lo<hi && s[lo] == s[lo+1] {
                        lo += 1
                    }
                    lo += 1
                    
                    while lo<hi && s[hi] == s[hi-1] {
                        hi -= 1
                    }
                    hi -= 1
                }
            }
            
            while i < s.count-2 && s[i] == s[i+1] {
                i += 1
            }
            i += 1
        }
        
        return result
    }
}

let sol = Solution()
print(sol.threeSum([0,0,0]))
