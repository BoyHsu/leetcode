//
//  main.swift
//  面试题 17.16. 按摩师
//
//  Created by 徐恩 on 2023/3/29.
//

import Foundation

class Solution {
    func massage(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return nums[0]
        } else if nums.count == 2 {
            return max(nums[0], nums[1])
        }
        
        var num1 = nums[0]
        var num2 = nums[1]
        var num3 = num1 + nums[2]
        for i in 3..<nums.count {
            let n = nums[i] + max(num1, num2)
            num1 = num2
            num2 = num3
            num3 = n
        }
        return max(num2, num3)
    }
    
//    func massage(_ nums: [Int]) -> Int {
//        return _massage(nums, 0, 0)
//    }
//
//    func _massage(_ nums: [Int], _ index: Int, _ result: Int) -> Int {
//        if index >= nums.count {
//            return result
//        }
//        let res1 = _massage(nums, index+2, result+nums[index])
//        let res2 = _massage(nums, index+1, result)
//
//        return max(res1, res2)
//    }
}

let s = Solution()
assert(s.massage([1,2,3,1]) == 4)
assert(s.massage([2,7,9,3,1]) == 12)
assert(s.massage([2,1,4,5,3,1,1,3]) == 12)
assert(s.massage([2,1,4,5,3,1,1,4,5,3,1,3,1,1,4,5,3,1,1,4,5,3,1,1,3]) == 36)
print("done")
