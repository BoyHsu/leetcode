//
//  main.swift
//  11. 盛最多水的容器
//
//  Created by 徐恩 on 2023/5/14.
//

import Foundation

class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var l = 0, r = height.count - 1
        var maxArea = min(height[r], height[l]) * (r-l)
        while l < r {
            if height[l] < height[r] {
                let h = height[l]
                
                repeat {
                    l += 1
                } while l < r && height[l] < h
            } else {
                let h = height[r]
                
                repeat {
                    r -= 1
                } while l < r && height[r] < h
            }
            maxArea = max(maxArea, min(height[r], height[l]) * (r-l))
        }
        return maxArea
    }
}

let s = Solution()
assert(s.maxArea([1,8,6,2,5,4,8,3,7]) == 49)
print("done")

