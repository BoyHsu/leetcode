//
//  main.swift
//  42. Trapping Rain Water
//
//  Created by ada_PC007 on 2017/6/12.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func trap(_ height: [Int]) -> Int {
        var maxIndex = 0, result = 0, last = 0, j = 1
        
        for i in 0..<height.count {
            if height[i] >= height[maxIndex] {
                maxIndex = i
            }
        }
        
        while j<maxIndex {
            if height[j] <= height[last] {
                result += height[last]-height[j]
            } else {
                last = j
            }
            j+=1
        }
        last = height.count-1; j = last-1
        while j>maxIndex {
            if height[j] <= height[last] {
                result += height[last]-height[j]
            } else {
                last = j
            }
            j-=1
        }
        return result
    }
}

print(Solution().trap([0,7,1,4,6]))
