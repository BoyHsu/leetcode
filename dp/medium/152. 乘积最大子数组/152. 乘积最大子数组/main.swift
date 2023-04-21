//
//  main.swift
//  152. 乘积最大子数组
//
//  Created by 徐恩 on 2023/3/29.
//

import Foundation

class Solution {
    
    func printCache(_ cache: [[Int?]]) {
        let charCount = 9
        for list in cache {
            print(list.map { val in
                var str = String()
                let strVal: String
                if let val = val {
                    strVal = String(val)
                } else {
                    strVal = "nil"
                }
                str.append(String(repeating: " ", count: charCount-strVal.count))
                str.append(strVal)
                return str
            }.joined())
        }
    }
    
//    func maxProduct(_ nums: [Int]) -> Int {
//        var l = 0
//        var res = Int.min
//        let count = nums.count
//        for i in 0..<count {
//            if nums[i] == 0 {
//                let pro = max(0, maxProduct(nums, l, i))
//                l = i+1
//                if pro > res {
//                    res = pro
//                }
//            }
//        }
//        let pro = maxProduct(nums, l, count)
//        if pro > res {
//            res = pro
//        }
//
//        return res
//    }
//
//    func maxProduct(_ nums: [Int], _ l: Int, _ r: Int) -> Int {
//        if l >= r {
//            return Int.min
//        }
//        let count = r-l
//        var cache = Array(repeating: 1, count: count+1)
//        var maxPro = Int.min
//        for i in 0..<count {
//            for j in 0..<(count-i) {
//                let pro = nums[l+j] * cache[j+1]
//                cache[j] = pro
//                if pro > maxPro {
//                    maxPro = pro
//                }
//            }
//        }
//        return maxPro
//    }
    
//    func maxProduct(_ nums: [Int]) -> Int {
//        var cache = Array(repeating: Array<Int?>(repeating: nil, count: nums.count), count: nums.count)
//        let res = _maxProduct(nums, 0, nums.count-1, nil, &cache)
//        printCache(cache)
//        return res
//    }
//
//    func _maxProduct(_ nums: [Int], _ l: Int, _ r: Int, _ pro: Int?, _ cache: inout [[Int?]]) -> Int {
//
//        if l == r || l == nums.count - 1 {
//            return nums[l] * (pro ?? 1)
//        }
//
//        if let pro = pro {
//            let newPro = pro*nums[l]
//            let res1 = _maxProductByCache(nums, l+1, r, newPro, &cache)
//            let res2 = _maxProductByCache(nums, l+1, r, nil, &cache)
//            return max(res1, res2, pro)
//        } else {
//            return _maxProductByCache(nums, l+1, r, nums[l], &cache)
//        }
//    }
//
//    func _maxProductByCache(_ nums: [Int], _ l: Int, _ r: Int, _ pro: Int?, _ cache: inout [[Int?]]) -> Int {
//        if let res = cache[l][r] {
//            return res
//        } else {
//            let res = _maxProduct(nums, l, r, pro, &cache)
//            cache[l][r] = res
//            return res
//        }
//    }
    
    
//    func maxProduct(_ nums: [Int]) -> Int {
//        let res = _maxProduct(nums, 0, nil)
//        return res
//    }
//
//    func _maxProduct(_ nums: [Int], _ l: Int, _ pro: Int?) -> Int {
//        if l == nums.count - 1 {
//            return nums[l]
//        }
//
//        let newPro = _maxProduct(nums, l+1, nil)
//        let n = nums[l]
//        let pro1 = pro ?? Int.min
//        let pro2 = n * (pro ?? 1)
//        let pro3 = newPro * n
//        //[-2,4,-2,4,-2,3,-2,4,-2,4,-2,4,-2,4,4,3]
//        return max(pro1, pro2, pro3, newPro)
//    }
    
        func maxProduct(_ nums: [Int]) -> Int {
            let res = _maxProduct(nums, 0, nil)
            return res
        }
    
        func _maxProduct(_ nums: [Int], _ l: Int, _ pro: Int?) -> Int {
            if l == nums.count - 1 {
                return nums[l]
            }
    
            let n = nums[l]
            let pro1 = _maxProduct(nums, l+1, n*(pro ?? 1))
            let pro2 = _maxProduct(nums, l+1, nil)
            //[-2,4,-2,4,-2,3,-2,4,-2,4,-2,4,-2,4,4,3]
            return max(pro1, pro2, (pro ?? Int.min), n)
        }
}

let s = Solution()

assert(s.maxProduct([3,-1,4]) == 4)
assert(s.maxProduct([-2]) == -2)
assert(s.maxProduct([2,3,-2,4]) == 6)
assert(s.maxProduct([-2,0,-1]) == 0)
assert(s.maxProduct([2,3,-2,4,3,-2,4,3,-2,4,-2,4,-2,4]) == 221184)
//assert(s.maxProduct([2,3,-2,4,3,-2,4,3,0,-2,4,-2,4,-2,3,-2,0,4,-2,4,-2,4,-2,4,-2,4]) == 16384)
//assert(s.maxProduct([2,3,-2,4,3,-2,4,3,0,-2,4,-2,4,-2,3,-2,0,4,-2,4,-2,4,-2,4,4,3,0,-2,4,-2,4,-2,3,-2,0,4,-2,4,-2,4,-2,4,4,3,0,-2,4,-2,4,-2,3,-2,0,4,-2,4,-2,4,-2,4,4,3,0,-2,3,-2,0,4,-2,4,-2,4,-2,4,4,3,0,-2,4,-2,4,-2,3,-2,0,4,-2,4,-2,4,-2,4,4,3,0,-2,4,-2,4,-2,3,-2,0,4,-2,4,-2,4,-2,4,4,3,0,-2,4,-2,4,-2,3,-2,0,4,-2,4,-2,4,-2,4,-2,4]) == 16384)
//assert(s.maxProduct([2,3,-2,4,3,-2,4,3,0,-2,4,-2,4,-2,3,-2,0,4,-2,4,-2,4,-2,4,4,3,0,-2,4,-2,4,-2,3,-2,0,4,-2,4,-2,4,-2,4,4,3,0,-2,4,-2,4,-2,3,-2,0,4,-2,4,-2,4,-2,4,4,3,0,-2,3,-2,0,4,-2,4,-2,4,-2,4,4,3,0,-2,4,-2,4,-2,3,-2,0,4,-2,4,-2,4,-2,4,4,3,0,-2,4,-2,4,-2,3,-2,4,-2,4,-2,4,-2,4,4,3,0,-2,4,-2,4,-2,3,-2,0,4,-2,4,-2,4,-2,4,-2,4]) == 9437184)
assert(s.maxProduct([-2,4,-2,4,-2,3,-2,4,-2,4,-2,4,-2,4,4,3]) == 9437184)

print("done")


