//
//  main.swift
//  134. 加油站
//
//  Created by 徐恩 on 2023/5/14.
//

import Foundation

class Solution {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        var totalDiff = 0
        var minDiff = Int.max, minIdx = 0
        
        for i in gas.indices {
            totalDiff += gas[i]-cost[i]
            if totalDiff < minDiff {
                minDiff = totalDiff
                minIdx = i
            }
        }
        
        if totalDiff < 0 {
            return -1
        } else {
            return minIdx + 1
        }
    }
}

