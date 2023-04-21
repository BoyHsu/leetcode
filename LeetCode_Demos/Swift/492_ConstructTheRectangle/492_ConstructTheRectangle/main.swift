//
//  main.swift
//  492_ConstructTheRectangle
//
//  Created by ada_PC007 on 2017/4/27.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func constructRectangle(_ area: Int) -> [Int] {
        let sqr = sqrt(Double(area))
        let rSqr = round(sqr)
        let intSqr = Int(sqr)
        
        if sqr == rSqr {
            return [intSqr, intSqr]
        } else {
            var result = 1
            
            for i in 1...intSqr {
                if area % i == 0 {
                    result = i
                }
            }
            return [area/result, result]
        }
    }
}
class Solution1 {
    func constructRectangle(_ area: Int) -> [Int] {
        let sqr = sqrt(Double(area))
        let rSqr = round(sqr)
        let intSqr = Int(rSqr)
        
        var result = 1
        
        for i in (1...intSqr).reversed() {
            if area % i == 0 {
                result = i
                break
            }
        }
        return [area/result, result]
    }
}
let sol = Solution()
let targetArea = 12

print(sol.constructRectangle(targetArea))
