//
//  main.swift
//  18. 四数之和
//
//  Created by 徐恩 on 2023/5/15.
//

import Foundation

class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        guard nums.count >= 4 else { return [] }
        var res = [[Int]]()
        let count = nums.count
        let nums = nums.sorted()
        for i in 0..<count-3 {
            if i > 0, nums[i-1] == nums[i] {
                continue
            }
            for j in i+1..<count-2 {
                if j-1 != i, nums[j-1] == nums[j] {
                    continue
                }
                var lo = j+1, hi = count-1
                while lo < hi {
                    if nums[i] + nums[j] + nums[lo] + nums[hi] == target {
                        res.append([nums[i],nums[j],nums[lo],nums[hi]])
                        while lo < hi, nums[lo] == nums[lo+1] {
                            lo += 1
                        }
                        while lo < hi, nums[hi] == nums[hi-1] {
                            hi -= 1
                        }
                        lo += 1
                        hi -= 1
                    } else if nums[i] + nums[j] + nums[lo] + nums[hi] > target {
                        hi -= 1
                    } else {
                        lo += 1
                    }
                }
            }
        }
        return res
    }
}

let s = Solution()
assert(s.fourSum([1,-2,-5,-4,-3,3,3,5], -11) == [[-5,-4,-3,1]])
assert(s.fourSum([-5,-4,-3,-2,-1,0,0,1,2,3,4,5], 0) == [[-5,-4,4,5],[-5,-3,3,5],[-5,-2,2,5],[-5,-2,3,4],[-5,-1,1,5],[-5,-1,2,4],[-5,0,0,5],[-5,0,1,4],[-5,0,2,3],[-4,-3,2,5],[-4,-3,3,4],[-4,-2,1,5],[-4,-2,2,4],[-4,-1,0,5],[-4,-1,1,4],[-4,-1,2,3],[-4,0,0,4],[-4,0,1,3],[-3,-2,0,5],[-3,-2,1,4],[-3,-2,2,3],[-3,-1,0,4],[-3,-1,1,3],[-3,0,0,3],[-3,0,1,2],[-2,-1,0,3],[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]])
assert(s.fourSum([-2,-1,-1,1,1,2,2], 0) == [[-2,-1,1,2],[-1,-1,1,1]])
assert(s.fourSum([2,2,2,2,2], 8) == [[2,2,2,2]])
assert(s.fourSum([1,0,-1,0,-2,2], 0) == [[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]])
print("done")

