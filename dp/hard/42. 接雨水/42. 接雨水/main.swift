//
//  main.swift
//  42. 接雨水
//
//  Created by 徐恩 on 2023/3/29.
//

import Foundation

class Solution {
    func trap(_ height: [Int]) -> Int {
        // [0,1,0,2,1,0,1,3,2,1,2,1] -> 6
        var stack = [Int]()
        var res = 0
        for i in height.indices {
            if stack.isEmpty {
                stack.append(i)
                continue
            }
            let h = height[i]
            
            if height[stack.last!] > h {
                stack.append(i)
                continue
            }
            
            var sum = 0
            var leftIdx = 0
            var leftH = 0
            var lastIdx = i
            for j in stack.indices.reversed() {
                leftIdx = stack[j]
                leftH = height[leftIdx]
                sum += leftH * (lastIdx-leftIdx)
                lastIdx = leftIdx
                
                
                if leftH < h {
                    stack.removeLast()
                } else {
                    break
                }
            }
            res += min(leftH, h) * (i - leftIdx) - sum
            if stack.isEmpty {
                stack.append(i)
            }
        }
        return res
    }
}

let s = Solution()
//assert(s.trap([0,1,0,2,1,0,1,3,2,1,2,1]) == 6)
assert(s.trap([4,2,0,3,2,5]) == 9)
