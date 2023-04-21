//
//  main.swift
//  274. H-Index
//
//  Created by ada_PC007 on 2017/5/23.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func hIndex(_ citations: [Int]) -> Int {
        var c = citations.sorted()
        var res = 0
        
        for i in 0..<c.count {
            if c[i] >= c.count - i - 1 {//[0,1,4,5,6]
                res = max(res, c.count - i)
            }
        }
        return res
    }
}

print(Solution().hIndex([4,0,6,1,5]))
