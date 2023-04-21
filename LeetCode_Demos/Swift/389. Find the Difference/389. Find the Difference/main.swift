//
//  main.swift
//  389. Find the Difference
//
//  Created by ada_PC007 on 2017/7/3.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func findTheDifference(_ s: String, _ t: String) -> Character {
        var cs = s.characters.sorted(), ct = t.characters.sorted()
        for i in 0..<cs.count {
            if cs[i] != ct[i] {
                return ct[i]
            }
        }
        return ct.last!
    }
}

print(Solution().findTheDifference("abcd", "deabc"))
