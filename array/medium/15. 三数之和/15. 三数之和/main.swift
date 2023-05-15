//
//  main.swift
//  15. 三数之和
//
//  Created by 徐恩 on 2023/5/15.
//

import Foundation

//class Solution {
//    func threeSum(_ nums: [Int]) -> [[Int]] {
//        var res = [[Int]]()
//        let nums = nums.sorted()
//        let count = nums.count
//
//        for i in 0..<count {
//            let numi = nums[i]
//            for j in i+1..<count {
//                let target = -(numi+nums[j])
//                var lo = 0, hi = count
//                while lo < hi {
//                    let mi = (lo+hi)/2
//                    if nums[mi] > target {
//                        hi = mi
//                    } else {
//                        lo = mi + 1
//                    }
//                }
//                if lo > 0 {
//                    lo -= 1
//                    if nums[lo] == target, lo != i, lo != j {
//                        res.append([numi, nums[j], target].sorted())
//                    }
//                }
//            }
//        }
//
//        return Array(Set(res))
//    }
//}

//class Solution {
//    func threeSum(_ nums: [Int]) -> [[Int]] {
//        var res = [[Int]]()
//                let nums = nums.sorted()
//                let count = nums.count
//
//                for i in 0..<count {
//                    if i > 0, nums[i] == nums[i-1] {
//                        continue
//                    }
//                    let numi = nums[i]
//                    for j in i+1..<count {
//                        if nums[j] == nums[j-1], j-1 != i {
//                            continue
//                        }
//                        let target = -(numi+nums[j])
//                        if target < 0 {
//                            continue
//                        }
//                        var lo = j+1, hi = count
//                        while lo < hi {
//                            let mi = (lo+hi)/2
//                            if nums[mi] > target {
//                                hi = mi
//                            } else {
//                                lo = mi + 1
//                            }
//                        }
//                        if lo > 0 {
//                            lo -= 1
//                            if nums[lo] == target, lo != i, lo != j {
//                                res.append([numi, nums[j], target])
//                            }
//                        }
//                    }
//                }
//
//                return res
//    }
//}

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        let count = nums.count
        
        for i in 0..<count-2 {
            if nums[i] > 0 {
                return res
            }
            if i > 0, nums[i] == nums[i-1] {
                continue
            }
            
            var lo = i+1, hi = count-1
            while lo < hi {
                if nums[i] + nums[lo] + nums[hi] == 0 {
                    res.append([nums[i], nums[lo], nums[hi]])
                    while lo < hi, nums[lo] == nums[lo+1] {
                        lo += 1
                    }
                    while lo < hi, nums[hi] == nums[hi-1] {
                        hi -= 1
                    }
                } else if nums[i] + nums[lo] + nums[hi] > 0 {
                    hi -= 1
                } else {
                    lo += 1
                }
            }
        }
        
        return res
    }
}

let s = Solution()
assert(s.threeSum([-1,0,1,2,-1,-4]) == [[-1,-1,2],[-1,0,1]])
print("done")

