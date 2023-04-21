//
//  main.swift
//  605. Can Place Flowers
//
//  Created by ada_PC007 on 2017/8/31.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        var zc = 1, fc = 0
        
        for i in flowerbed {
            if i == 0 {
                zc += 1
            } else {
                if zc > 1 {
                    fc += (zc-1)>>1
                }
                zc = 0
            }
        }
        if zc > 0 {
            fc += zc>>1
        }
    
        return n <= fc
    }
}

print(Solution().canPlaceFlowers([0,0,1,0,1], 1))
