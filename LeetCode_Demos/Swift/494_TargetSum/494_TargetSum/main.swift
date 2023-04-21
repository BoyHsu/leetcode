//
//  main.swift
//  494_TargetSum
//
//  Created by ada_PC007 on 2017/5/11.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func findTargetSumWays(_ nums: [Int], _ S: Int) -> Int {
        var result = 0
        
        for i in 0..<1<<nums.count {
            var sum = 0
            
            for j in 0..<nums.count {
                sum += nums[j]*(2*((i>>j) & 1) - 1)
            }
            if sum == S {
                result+=1
            }
        }
        
        return result
    }
}

class Solution1 {
    func findTargetSumWays(_ nums: [Int], _ S: Int) -> Int {
        
        if nums.count == 1 {
            var result = 0
            
            if nums[0] == S {
                result += 1
            }
            if nums[0] == -S {
                result += 1
            }
            return result
        }
        var s = nums
        let n = s.remove(at: nums.count-1)
        
        return findTargetSumWays(s, S+n) + findTargetSumWays(s, S-n)
    }
}

class Solution2 {
    func findTargetSumWays(_ nums: [Int], _ S: Int) -> Int {
        var ans = [0]
        
        for i in 0..<nums.count {
            var res = [Int]()
            
            for j in ans {
                res.append(j+nums[i])
            }
            for j in ans {
                res.append(j-nums[i])
            }
            ans = res
        }
        var sum = 0
        for i in ans {
            if i == S {
                sum+=1
            }
        }
        return sum
    }
}

//print(Solution2().findTargetSumWays([1, 2, 3, 4, 5, 6], 3))// == 5
print(Solution2().findTargetSumWays([10,9,6,4,19,0,41,30,27,15,14,39,33,7,34,17,24,46,2,46], 45))// == 6606
