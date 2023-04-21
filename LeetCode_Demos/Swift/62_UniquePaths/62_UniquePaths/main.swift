//
//  main.swift
//  62_UniquePaths
//
//  Created by ada_PC007 on 2017/5/10.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var paths = Array(repeating: Array(repeating: 1, count: m), count: n)
        
        for i in 1..<n {
            for j in 1..<m {
                paths[i][j] = paths[i][j-1]+paths[i-1][j]
            }
        }
        for i in paths {
            print(i)
        }
        return paths[n-1][m-1]
    }
}

class Solution1 {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var result = Array(repeating: 1, count: n)
        
        for _ in 1..<m {
            for j in 1..<n {
                result[j] += result[j-1]
            }
        }
        return result.last!
    }
}

class Solution2 {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        if n == 1 || m == 1 {
            return 1
        }
        return uniquePaths(m-1, n) + uniquePaths(m, n-1)
    }
}

let sol = Solution2()

print(sol.uniquePaths(5, 5))

//for i in 1...4 {
//    for j in 1...4 {
//        print(i,j,">>>",sol.uniquePaths(i, j))
//    }
//}
