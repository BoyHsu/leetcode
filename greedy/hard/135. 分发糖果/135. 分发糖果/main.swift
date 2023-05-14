//
//  main.swift
//  135. 分发糖果
//
//  Created by 徐恩 on 2023/5/14.
//

import Foundation

class Solution {
    func candy(_ ratings: [Int]) -> Int {
        var res = Array(repeating: 1, count: ratings.count)
        for i in 1..<ratings.count {
            if ratings[i] > ratings[i-1] {
                res[i] = max(res[i-1]+1, res[i])
            }
        }
        
        for i in (0..<ratings.count-1).reversed() {
            if ratings[i]>ratings[i+1] {
                res[i] = max(res[i+1]+1, res[i])
            }
        }
        var sum = 0
        for num in res {
            sum += num
        }
        return sum
    }
}

