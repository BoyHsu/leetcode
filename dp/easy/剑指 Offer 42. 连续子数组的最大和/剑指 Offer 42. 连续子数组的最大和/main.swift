//
//  main.swift
//  剑指 Offer 42. 连续子数组的最大和
//
//  Created by 徐恩 on 2023/3/29.
//

import Foundation

class Solution {
    //[-2,1,-3,4,-1,2,1,-5,4] -> 6
    func maxSubArray(_ nums: [Int]) -> Int {
        var maxSum = Int.min
        var sum = 0
        
        for num in nums {
            if sum < 0 {
                maxSum = max(maxSum, sum)
                sum = 0
            }
            sum += num
            maxSum = max(maxSum, sum)
        }
        return max(maxSum, sum)
    }
    
    
    /**
     recursive
     */
//    func maxSubArray(_ nums: [Int]) -> Int {
//        let res = _maxSubArray(nums, 0, 0, 0)
//        return res
//    }
//
//    func _maxSubArray(_ nums: [Int], _ index: Int, _ sum: Int, _ res: Int) -> Int {
//        if index >= nums.count {
//            return max(res, sum)
//        }
//        let res1 = _maxSubArray(nums, index + 1, sum + nums[index], res)
//        let res2 = _maxSubArray(nums, index + 1, 0, max(res, sum))
//
//        return max(res1, res2)
//    }
}

let s = Solution()
//assert(s.maxSubArray([4,-1,2,1]) == 6)
assert(s.maxSubArray([-2,1,-3,4,-1,2,1,-5,4]) == 6)
print("done")
