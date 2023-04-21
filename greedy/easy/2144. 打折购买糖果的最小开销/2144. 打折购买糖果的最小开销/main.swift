//
//  main.swift
//  2144. 打折购买糖果的最小开销
//
//  Created by 徐恩 on 2023/3/31.
//

import Foundation

class Solution {
    func minimumCost(_ cost: [Int]) -> Int {
        let cost = cost.sorted(by: { $0 > $1})
        var res = 0
        for i in (0..<cost.count) {
            if i % 3 == 2 {
                continue
            }
            res += cost[i]
        }
        return res
    }
}

let s = Solution()
assert(s.minimumCost([1,2,3]) == 5)
assert(s.minimumCost([6,5,7,9,2,2]) == 23)
assert(s.minimumCost([5,5]) == 10)
print("done")
