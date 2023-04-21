//: Playground - noun: a place where people can play

import UIKit

class Solution {
    func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
        var col = [matrix[0][0]]
        
        for nums in matrix {
            for num in nums {
                var lo = 0
                var hi = col.count
                var mi = hi/2
                
                while mi > lo {
                    num > col[mi] ? (lo = mi) : (hi = mi)
                    mi = (lo + hi)/2
                }
                mi += 1
                if mi <= k {
                    col.insert(num, at: mi)
                }
            }
        }
        return col[k]
    }
}

let sol = Solution()
sol.kthSmallest([[1,5,9],[10,11,13],[12,13,15]], 8)
