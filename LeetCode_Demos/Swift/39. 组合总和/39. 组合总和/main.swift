//
//  main.swift
//  39. 组合总和
//
//  Created by ada_PC007 on 2018/6/21.
//  Copyright © 2018年 AdaTech. All rights reserved.
//

import Foundation

class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        let nums = candidates.sorted()
        
        var dp: [[[Int]]] = Array(repeating: [], count: target+1)
        var res: [[Int]] = []
        
        for num in nums {
            if num > target {
                continue
            }
            for j in num...target {
                var pre = dp[j-num]
                if pre.count != 0 {
                    for i in 0..<pre.count {
                        pre[i].append(num)
                    }
                } else {
                    if j%num == 0 {
                        pre.append(Array(repeating: num, count: j/num))
                    }
                }
                if pre.count != 0 {
                    let isFinal = target == j
                    for temp in pre {
                        dp[j].append(temp)
                        if isFinal {
                            res.append(temp)
                        }
                    }
                }
            }
        }
        
        return res
    }
}


var arr: [Int] = []

//arr = [2,3,6,7]
//print(Solution().combinationSum(arr, 7))

//arr = [2,3,5]
//print(Solution().combinationSum(arr, 8))

arr = [1,2]
print(Solution().combinationSum(arr, 4))
