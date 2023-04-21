//
//  main.swift
//  605. 种花问题
//
//  Created by 徐恩 on 2023/3/30.
//

import Foundation

class Solution {
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        var last = -2
        var count = 0
        for i in flowerbed.indices {
            let f = flowerbed[i]
            if f == 1 {
                let empty = i - last - 1
                count += (empty - 1)/2
                last = i
            }
        }
        
        let empty = flowerbed.count - last
        count += (empty - 1)/2
        
        return count >= n
    }
}

let s = Solution()
assert(s.canPlaceFlowers([1,0,0,0,1], 1) == true)
assert(s.canPlaceFlowers([1,0,0,0,1], 2) == false)
assert(s.canPlaceFlowers([0,0,0,0,1], 2) == true)
assert(s.canPlaceFlowers([0,0,0,0,0], 3) == true)
print("done")
