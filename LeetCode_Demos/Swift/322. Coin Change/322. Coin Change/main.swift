//
//  main.swift
//  322. Coin Change
//
//  Created by ada_PC007 on 2017/5/22.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        var count0 = amount/coins[0]
        if coins.count == 1 {
            if amount%coins[0] == 0 {
                return count0
            } else {
                return -1
            }
        }
        
        for i in 1..<coins.count {
            
        }
        
    }
}

