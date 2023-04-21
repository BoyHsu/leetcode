//
//  main.swift
//  657. Judge Route Circle
//
//  Created by ada_PC007 on 2017/9/4.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func judgeCircle(_ moves: String) -> Bool {
        var x = 0, y = 0
        
        for ch in moves.characters {
            if ch == "U" {
                y += 1
            } else if ch == "D" {
                y -= 1
            } else if ch == "L" {
                x -= 1
            } else if ch == "R" {
                x += 1
            }
        }
        
        return x == 0 && y == 0
    }
}

class Solution1 {
    func judgeCircle(_ moves: String) -> Bool {
        var dict:[Character: Int] = ["U": 0, "D": 0, "R": 0, "L": 0]
        
        for ch in moves.characters {
            dict[ch] = dict[ch]! + 1
        }
        
        return dict["U"]==dict["D"] && dict["R"] == dict["L"]
    }
}
