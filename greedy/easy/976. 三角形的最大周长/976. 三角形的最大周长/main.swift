//
//  main.swift
//  976. 三角形的最大周长
//
//  Created by 徐恩 on 2023/3/30.
//

import Foundation

class Solution {
    func largestPerimeter(_ nums: [Int]) -> Int {
        let nums = nums.sorted()
        var n1 = nums.last!, n2 = nums[nums.count-2]
        for i in (0..<nums.count-2).reversed() {
            let n = nums[i]
            if n+n2>n1 {
                return n + n1 + n2
            }
            n1 = n2
            n2 = n
        }
        return 0
    }
}

let s = Solution()
assert(s.largestPerimeter([2,1,2]) == 5)
assert(s.largestPerimeter([1,2,1,10]) == 0)
print("done")
