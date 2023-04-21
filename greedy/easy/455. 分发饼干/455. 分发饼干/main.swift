//
//  main.swift
//  455. 分发饼干
//
//  Created by 徐恩 on 2023/3/30.
//

import Foundation

class Solution {
    func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
        let g = g.sorted()
        let s = s.sorted().reversed()
        
        var res = 0
        var r = g.count
        for val in s {
            let idx = _findChild(g, val, 0, r)
            if idx == -1 {
                break
            }
            res += 1
            r = idx
        }
        
        return res
    }
    
    func _findChild(_ g: [Int], _ val: Int, _ l: Int, _ e: Int) -> Int {
        if l == e {
            return -1
        }
        var l = l, e = e
        while (l < e) {
            let mi = (l + e) / 2
            let vm = g[mi]
            if vm > val {
                e = mi
            } else {
                l = mi+1
            }
        }
        return l - 1
//        for i in (l..<e).reversed() {
//            if g[i] <= val {
//                return i
//            }
//        }
//        return -1
    }
}

let s = Solution()
assert(s.findContentChildren([1,2,3], [1,1]) == 1)
assert(s.findContentChildren([1,2], [1,2,3]) == 2)
assert(s.findContentChildren([1,2,2], [1,2,3]) == 3)
assert(s.findContentChildren([2,2,2], [1,2,2]) == 2)
print("done")
