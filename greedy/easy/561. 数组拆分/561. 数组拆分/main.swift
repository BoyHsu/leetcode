//
//  main.swift
//  561. 数组拆分
//
//  Created by 徐恩 on 2023/3/30.
//

import Foundation

class Solution {
    func arrayPairSum(_ nums: [Int]) -> Int {
        let nums = nums.sorted()
        var sum = 0
        for i in stride(from: 0, to: nums.count, by: 2) {
            sum += nums[i]
        }
        return sum
    }
}

let s = Solution()
assert(s.arrayPairSum([1,4,3,2]) == 4)
assert(s.arrayPairSum([6,2,6,5,1,2]) == 9)
assert(s.arrayPairSum([1,2,4,5,6,7,8,3,9,10]) == 25)
print("done")
