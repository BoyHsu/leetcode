//
//  main.swift
//  4_MedianofTwoSortedArrays
//
//  Created by ada_PC007 on 2017/5/11.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var r = [Int]()
        var i = 0, j = 0
        
        while i < nums1.count || j < nums2.count {
            if i < nums1.count && (j >= nums2.count || nums1[i] < nums2[j]) {
                r.append(nums1[i])
                i+=1
                continue
            }
            if j < nums2.count && (i >= nums1.count || nums1[i] >= nums2[j]) {
                r.append(nums2[j])
                j+=1
            }
        }
        var result = Double(r[r.count>>1])
        if r.count&1 == 0 {
            result += Double(r[r.count>>1-1])
            result /= 2
        }
        return result
    }
}

class Solution1 {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var r = [Int]()
        var i = 0, j = 0
        
        while (i < nums1.count || j < nums2.count) && r.count <= (nums1.count+nums2.count)>>1 {
            if i < nums1.count && (j >= nums2.count || nums1[i] < nums2[j]) {
                r.append(nums1[i])
                i+=1
                continue
            }
            if j < nums2.count && (i >= nums1.count || nums1[i] >= nums2[j]) {
                r.append(nums2[j])
                j+=1
            }
        }
        
        var result = Double(r[(nums1.count+nums2.count)>>1])
        if (nums1.count+nums2.count)&1 == 0 {
            result += Double(r[(nums1.count+nums2.count)>>1-1])
            result /= 2
        }
        return result
    }
}

print(Solution1().findMedianSortedArrays([2,3,4,5],[]))
