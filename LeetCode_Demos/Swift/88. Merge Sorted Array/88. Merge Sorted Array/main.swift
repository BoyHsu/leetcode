//
//  main.swift
//  88. Merge Sorted Array
//
//  Created by ada_PC007 on 2017/8/2.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        let nums3 = nums1
        var i = -1, i1 = 0, i2 = 0
        
        while i2 < n || i1 < m {
            i += 1
            
            if i2 < n && (m <= i1 || nums2[i2] <= nums3[i1])  {
                nums1[i] = nums2[i2]
                i2 += 1
                continue
            }
            if i1 < m && (n <= i2 || nums3[i1] <= nums2[i2]) {
                nums1[i] = nums3[i1]
                i1 += 1
            }
        }
    }
}

let m = arc4random_uniform(50), n = m - arc4random_uniform(m)

var nums1 = Array(repeatElement(Int(arc4random_uniform(100)), count: Int(m+n))), nums2 = Array(repeatElement(Int(arc4random_uniform(100)), count: Int(n)))

for i in 1..<Int(m) {
    nums1[i] = nums1[i-1] + Int(arc4random_uniform(10))
}

for i in 1..<Int(n) {
    nums2[i] = nums2[i-1] + Int(arc4random_uniform(10))
}
print(nums1)
print()
print(nums2)
print()
Solution().merge(&nums1, Int(m), nums2, Int(n))
print(nums1)
		
