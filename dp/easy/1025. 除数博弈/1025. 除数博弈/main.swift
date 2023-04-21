//
//  main.swift
//  1025. 除数博弈
//
//  Created by 徐恩 on 2023/3/28.
//

import Foundation

class Solution {
    func divisorGame(_ n: Int) -> Bool {
        var arr = Array<Bool?>(repeating: nil, count: n+1)
        arr[1] = false
        var idx = 2
        while idx <= n {
            if arr[idx] == nil {
                var res = arr[idx-1] ?? false
                var curIdx = idx
                while curIdx <= n {
                    res.toggle()
                    arr[curIdx] = res
                    curIdx += idx
                }
            }
            idx += 1
        }
        return arr[n] ?? false
    }
}

let s = Solution()
print(s.divisorGame(2))
print(s.divisorGame(13))
