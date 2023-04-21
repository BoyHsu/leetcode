//
//  main.swift
//  396. Rotate Function
//
//  Created by ada_PC007 on 2017/5/23.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func maxRotateFunction(_ A: [Int]) -> Int {
        var res = Int.min
        
        for i in 0..<A.count {
            var sum = 0
            for j in 0..<A.count {
                var k = j+i
                if k>A.count-1 {
                    k-=A.count
                }
                sum += k*A[j]
                if j == A.count/2 {
                    print(sum)
                }
            }
            res = max(res, sum)
        }
        print(res)
        return res
    }
}

class Solution1 {
    func maxRotateFunction(_ A: [Int]) -> Int {
        var res = [Int]()
        
        for i in 0..<A.count {
            var sum = 0
            for j in 0..<A.count {
                var k = j+i
                if k>A.count-1 {
                    k-=A.count
                }
                sum += k*A[j]
                if j == A.count/2 {
                    print(sum)
                }
            }
            res.append(sum)
        }
        print(res)
        return res.max()!
    }
}

class Solution2 {
    func maxRotateFunction(_ A: [Int]) -> Int {
        var allSum = 0, sum = 0, res = Int.min
        
        for i in 0..<A.count {
            sum += A[i]
            allSum += A[i]*i
        }
        
        for i in 0..<A.count {
            allSum -= sum
            allSum += A[i]*A.count
            res = max(allSum, res)
        }
        return res
    }
}

class Solution3 {
    func maxRotateFunction(_ A: [Int]) -> Int {
        var allSum = 0, sum = 0, res = Int.min
        
        for i in 0..<A.count {
            sum += A[i]
            allSum += A[i]*i
        }
        
        for i in 0..<A.count {
            allSum -= sum
            allSum += A[i]*A.count
            res = max(allSum, res)
        }
        return res
    }
}

print(Solution3().maxRotateFunction([1,2,6,8,3,4,7,5]))
