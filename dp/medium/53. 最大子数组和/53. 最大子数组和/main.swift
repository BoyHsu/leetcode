//
//  main.swift
//  53. 最大子数组和
//
//  Created by 徐恩 on 2023/3/29.
//

import Foundation

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var maxSum = Int.min
        var sum = 0
        for num in nums {
            if sum < 0 {
                sum = 0
            }
            sum += num
            maxSum = max(sum, maxSum)
        }
        return maxSum
    }
}

let s = Solution()
assert(s.maxSubArray([-2,1,-3,4,-1,2,1,-5,4]) == 6)
assert(s.maxSubArray([5,4,-1,7,8]) == 23)
assert(s.maxSubArray([1]) == 1)
print("done")
