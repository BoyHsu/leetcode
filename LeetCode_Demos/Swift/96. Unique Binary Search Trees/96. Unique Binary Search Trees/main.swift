//
//  main.swift
//  96. Unique Binary Search Trees
//
//  Created by ada_PC007 on 2017/5/19.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

//h(n)=h(n-1)*(4*n-2)/(n+1);

class Solution {
    func numTrees(_ n: Int) -> Int {
        if n < 2 {
            return 1
        }
        var a = 1
        for i in 2...n {
            a = a*(4*i-2)/(i+1)
        }
        return a
    }
}

print(Solution().numTrees(3))
