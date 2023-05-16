//
//  main.swift
//  27. 移除元素
//
//  Created by 徐恩 on 2023/5/16.
//

import Foundation

class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        guard !nums.isEmpty else { return 0 }
        var l = 0, r = nums.count-1
        while l < r {
            while l < r, nums[l] != val {
                l += 1
            }
            while l < r, nums[r] == val {
                r -= 1
            }
            if l == r {
                break
            }
            nums[l] = nums[r]
            
            l += 1
            r -= 1
        }
        return r + (nums[r] == val ? 0 : 1)
    }
}

let s = Solution()
var res = [0]
res = [3]
assert(s.removeElement(&res, 3) == 0)
res = [1,3,2,2,2,3]
assert(s.removeElement(&res, 3) == 4)
res = []
assert(s.removeElement(&res, 3) == 0)
print("done")

