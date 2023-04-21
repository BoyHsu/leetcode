//
//  main.swift
//  118. 杨辉三角
//
//  Created by 徐恩 on 2023/3/28.
//

import Foundation

class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
//        if numRows == 1 {
//            return [[1]]
//        } else if numRows == 2 {
//            return [[1], [1, 1]]
//        } else if numRows == 3 {
//            return [[1], [1, 1], [1, 2, 1]]
//        }
//        var res = [[1], [1, 1], [1, 2, 1]]
//        var last = res.last!
//        for i in 4 ... numRows {
//            var seq = Array(repeating: 1, count: i)
//            var lastVal = i - 2
//            seq[1] = lastVal + 1
//            seq[i-2] = lastVal + 1
//            for j in 2..<i-2 {
//                let val = last[j]
//                seq[j] = lastVal + val
//                lastVal = val
//            }
//            res.append(seq)
//            last = seq
//        }
        
        var res = [[1]]
        var curSeq = [1]
        for i in 1..<numRows {
            var lastVal = 1
            for j in 1 ..< i {
                let val = curSeq[j]
                curSeq[j] = lastVal + val
                lastVal = val
            }
            curSeq.append(1)
            res.append(curSeq)
        }
        return res
    }
}

func printArr(_ arr: [[Int]]) {
    for subArr in arr {
        print(subArr.map{"\($0)"}.joined(separator: " "))
    }
}

let s = Solution()
printArr(s.generate(30))




