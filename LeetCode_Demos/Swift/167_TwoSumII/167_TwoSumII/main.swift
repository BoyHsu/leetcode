//
//  main.swift
//  167_TwoSumII
//
//  Created by ada_PC007 on 2017/4/25.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var posi = binarySearch(numbers, target, 0, numbers.count)
        
        if numbers[posi] != target {
            posi += 1
        }
        
        for i in 0..<posi-1 {
            let curVal = numbers[i]
            let tarVal = target - curVal
            
            let tarPosi = binarySearch(numbers, tarVal, i+1, posi)
            
            if tarVal == numbers[tarPosi] {
                return [i, tarPosi]
            }
        }
        return []
    }
    
    func binarySearch(_ nums: [Int], _ num: Int, _ lo: Int, _ hi: Int) -> Int {
        var l = lo
        var h = hi
        
        while l + 1 < h {
            let mi = (l + h) >> 1
            
            num < nums[mi] ? (h = mi) : (l = mi)
        }
        return l
    }
}

class Solution1 {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        
        
        for i in 0..<numbers.count {
            let curVal = numbers[i]
            let tarVal = target - curVal
            
            let tarPosi = binarySearch(numbers, tarVal, i+1, numbers.count)
            
            if tarVal == numbers[tarPosi] {
                return [i+1, tarPosi+1]
            }
        }
        return []
    }
    
    func binarySearch(_ nums: [Int], _ num: Int, _ lo: Int, _ hi: Int) -> Int {
        var l = lo
        var h = hi
        
        while l + 1 < h {
            let mi = (l + h) >> 1
            
            num < nums[mi] ? (h = mi) : (l = mi)
        }
        return l
    }
}

class Solution2 {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        
        
        for i in 0..<numbers.count {
            let curVal = numbers[i]
            let tarVal = target - curVal
            
            let tarPosi = binarySearch(numbers, tarVal, i+1, numbers.count)
            
            if tarVal == numbers[tarPosi] {
                return [i+1, tarPosi+1]
            }
        }
        return []
    }
    
    func binarySearch(_ nums: [Int], _ num: Int, _ lo: Int, _ hi: Int) -> Int {
        var l = lo
        var h = hi
        
        while l + 1 < h {
            let mi = (l + h) >> 1
            
            num < nums[mi] ? (h = mi) : (l = mi)
        }
        return l
    }
}

class Solution3 {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var lo = 0, hi = numbers.count-1
        
        while numbers[lo] + numbers[hi] != target {
            if numbers[lo] + numbers[hi] < target {
                lo+=1
            } else {
                hi-=1
            }
        }
        return [lo+1, hi+1]
    }
}

let count = 10


var arr = Array(0..<count)

let sol = Solution3()

let ran = Int(arc4random_uniform(UInt32(count)))

//arr.remove(at: ran)

print(ran, sol.twoSum(arr, ran))

//print(sol.twoSum([-1, 0], -1))
