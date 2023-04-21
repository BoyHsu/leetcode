//
//  main.swift
//  551. Student Attendance Record I
//
//  Created by ada_PC007 on 2017/9/4.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func checkRecord(_ s: String) -> Bool {
        var aCount = 0, lCount = 0
        let A: Character = "A", l: Character = "L"
        
        for ch in s.characters {
            if ch == A {
                if aCount == 1 {
                    return false
                }
                aCount += 1
                lCount = 0
            } else if ch == l {
                if lCount == 2 {
                    return false
                }
                lCount += 1
            } else {
                lCount = 0
            }
        }
        return true
    }
}

