//
//  main.swift
//  1013. 将数组分成和相等的三个部分
//
//  Created by 徐恩 on 2023/3/30.
//

import Foundation

class Solution {
    func canThreePartsEqualSum(_ arr: [Int]) -> Bool {
        var sum = 0
        for n in arr {
            sum += n
        }
        if sum % 3 != 0 {
            return false
        }
        
        sum /= 3
        
        var l = -1
        var subSum = 0
        for i in 0..<arr.count-2 {
            subSum += arr[i]
            if subSum == sum {
                l = i
                break
            }
        }
        
        if l == -1 {
            return false
        }
        
        var r = l
        subSum = 0
        
        for j in l+1..<arr.count-1 {
            subSum += arr[j]
            if subSum == sum {
                r = j
                break
            }
        }
        
        if r == l {
            return false
        }
        
        return true
    }
}

let s = Solution()
assert(s.canThreePartsEqualSum([0,2,1,-6,6,-7,9,1,2,0,1]) == true)
assert(s.canThreePartsEqualSum([0,2,1,-6,6,7,9,-1,2,0,1]) == false)
assert(s.canThreePartsEqualSum([3,3,6,5,-2,2,5,1,-9,4]) == true)
print("done")

