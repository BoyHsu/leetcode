//
//  main.swift
//  167. Two Sum II - Input array is sorted
//
//  Created by ada_PC007 on 2017/9/5.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var lo = 0, hi = numbers.count-1
        while true {
            let diff = numbers[lo] + numbers[hi] - target
            if diff == 0 {
                break
            } else if diff > 0 {
                hi -= 1
            } else {
                lo += 1
            }
        }
        return [lo, hi]
    }
}

