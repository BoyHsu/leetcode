//
//  main.swift
//  1217. 玩筹码
//
//  Created by 徐恩 on 2023/3/30.
//

import Foundation

class Solution {
    func minCostToMoveChips(_ position: [Int]) -> Int {
        if position.count == 1 {
            return 0
        }
        var sum1 = 0
        var sum2 = 0
        for p in position {
            if p % 2 == 0 {
                sum1 += 1
            } else {
                sum2 += 1
            }
        }
        return min(sum1, sum2)
    }
}


let s = Solution()
assert(s.minCostToMoveChips([1,2,3]) == 1)
assert(s.minCostToMoveChips([2,2,2,3,3]) == 2)
assert(s.minCostToMoveChips([1,1000000000]) == 1)
print("done")
