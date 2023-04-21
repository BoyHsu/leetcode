//
//  main.swift
//  481_MagicalString
//
//  Created by ada_PC007 on 2017/4/25.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func magicalString(_ n: Int) -> Int {
        return n >> 1 + n%18
    }
}

