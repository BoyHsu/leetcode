//
//  main.swift
//  1005. K 次取反后最大化的数组和
//
//  Created by 徐恩 on 2023/3/30.
//

import Foundation

class Solution {
    func largestSumAfterKNegations(_ nums: [Int], _ k: Int) -> Int {
        var countNega = 0
        for num in nums {
            if num < 0 {
                countNega += 1
            }
        }
        
        var sum = 0
        if countNega < k {
            var min = Int.max
            for num in nums {
                let absNum = abs(num)
                if min > absNum {
                    min = absNum
                }
                sum += absNum
            }
            if countNega % 2 != k % 2 {
                sum -= 2*min
            }
        } else {
            let nums = nums.sorted()
            for i in nums.indices {
                if i < k {
                    sum -= nums[i]
                } else {
                    sum += nums[i]
                }
            }
        }
        return sum
    }
}

let s = Solution()
//assert(s.largestSumAfterKNegations([4,2,3], 1) == 5)
//assert(s.largestSumAfterKNegations([3,-1,0,2], 3) == 6)
//assert(s.largestSumAfterKNegations([2,-3,-1,5,-4], 2) == 13)
//assert(s.largestSumAfterKNegations([5,6,9,-3,3], 2) == 20)
assert(s.largestSumAfterKNegations([8,-7,-3,-9,1,9,-6,-9,3], 8) == 53)
assert(s.largestSumAfterKNegations([4,-5,4,-5,9,4,5], 1) == 26)
print("done")
