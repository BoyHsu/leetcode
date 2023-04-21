//
//  main.swift
//  1710. 卡车上的最大单元数
//
//  Created by 徐恩 on 2023/3/31.
//

import Foundation

class Solution {
    func maximumUnits(_ boxTypes: [[Int]], _ truckSize: Int) -> Int {
        let boxTypes = boxTypes.sorted(by: { $0[1] > $1[1] })
        var units = 0
        var boxes = 0
        for boxType in boxTypes {
            let boxCount = boxType[0]
            let count = min(boxCount, truckSize-boxes)
            if count == 0 {
                break
            }
            units += count * boxType[1]
            boxes += count
        }
        return units
    }
}

let s = Solution()
assert(s.maximumUnits([[1,3],[2,2],[3,1]], 4) == 8)
assert(s.maximumUnits([[5,10],[2,5],[4,7],[3,9]], 10) == 91)
print("done")

