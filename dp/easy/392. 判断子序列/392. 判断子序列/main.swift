//
//  main.swift
//  392. 判断子序列
//
//  Created by 徐恩 on 2023/3/28.
//

import Foundation

class Solution {
//    func isSubsequence(_ s: String, _ t: String) -> Bool {
//        return _isSubsequence(s, s.startIndex, t, t.startIndex) == s.count
//    }
    
//    func isSubsequence(_ s: String, _ t: String) -> Bool {
//        var cache = Array(repeating: Array(repeating: -1, count: t.count+1), count: s.count+1)
//        return _isSubsequence1(s, s.count-1, t, t.count-1, &cache) == s.count
//    }
    
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        if s.isEmpty {
            return true
        }
        var res = false
        var sIdx = s.startIndex
        var sCh = s[sIdx]
        for tCh in t {
            if tCh == sCh {
                sIdx = s.index(after: sIdx)
                if sIdx == s.endIndex {
                    res = true
                    break
                } else {
                    sCh = s[sIdx]
                }
            }
        }
        return res
    }
    
//    func isSubsequence(_ s: String, _ t: String) -> Bool {
//        var cache = Array(repeating: 0, count: s.count+1)
//        for tIdx in (0..<t.count).reversed() {
//            var last = cache.last!
//            let tChar = t[t.index(t.startIndex, offsetBy: tIdx)]
//            for sIdx in (0..<s.count).reversed() {
//                let sChar = s[s.index(s.startIndex, offsetBy: sIdx)]
//                let cur = cache[sIdx]
//                if sChar == tChar {
//                    cache[sIdx] = 1 + last
//                } else {
//                    cache[sIdx] = max(cur, last)
//                }
//                last = cur
//            }
//        }
//
//        return cache[0] == s.count
//    }
    
//    func isSubsequence(_ s: String, _ t: String) -> Bool {
//        var cache = Array(repeating: Array(repeating: 0, count: s.count+1), count: t.count+1)
//
//        for tIdx in (0..<t.count).reversed() {
//            for sIdx in (0..<s.count).reversed() {
//                let sChar = s[s.index(s.startIndex, offsetBy: sIdx)]
//                let tChar = t[t.index(t.startIndex, offsetBy: tIdx)]
//
//                if sChar == tChar {
//                    cache[tIdx][sIdx] = 1 + cache[tIdx+1][sIdx+1]
//                } else {
//                    let res1 = cache[tIdx+1][sIdx]
//                    let res2 = cache[tIdx][sIdx+1]
//                    cache[tIdx][sIdx] = max(res1, res2)
//                }
//            }
//        }
//
//        return cache[0][0] == s.count
//    }
    
    func _isSubsequence1(_ s: String, _ sIdx: Int, _ t: String, _ tIdx: Int, _ cache: inout [[Int]]) -> Int {
        if sIdx < 0 || tIdx < 0 {
            return 0
        }
        let len = cache[sIdx][tIdx]
        if len >= 0 {
            return len
        }
        let sChar = s[s.index(s.startIndex, offsetBy: sIdx)]
        let tChar = t[t.index(t.startIndex, offsetBy: tIdx)]
        
        if sChar == tChar {
            return 1 + _isSubsequence1(s, sIdx-1, t, tIdx-1, &cache)
        } else {
            let res1 = _isSubsequence1(s, sIdx-1, t, tIdx, &cache)
            let res2 = _isSubsequence1(s, sIdx, t, tIdx-1, &cache)
            return max(res1, res2)
        }
    }
    
    func _isSubsequence(_ s: String, _ sIdx: String.Index, _ t: String, _ tIdx: String.Index) -> Int {
        if sIdx == s.endIndex || tIdx == t.endIndex {
            return 0
        }
        let sChar = s[sIdx]
        let tChar = t[tIdx]
        
        let sIdx1 = s.index(after: sIdx)
        let tIdx1 = t.index(after: tIdx)
        if sChar == tChar {
            return 1 + _isSubsequence(s, sIdx1, t, tIdx1)
        } else {
            let res1 = _isSubsequence(s, sIdx1, t, tIdx)
            let res2 = _isSubsequence(s, sIdx, t, tIdx1)
            return max(res1, res2)
        }
    }
}

let s = Solution()


print(s.isSubsequence("aaaaaa", "bbaaaa") == false)
print(s.isSubsequence("", "a") == true)
print(s.isSubsequence("ab", "") == false)
print(s.isSubsequence("a", "ab") == true)
print(s.isSubsequence("ixjex", "asdixksjekxks") == true)
print(s.isSubsequence("ixajex", "asdixksjekxks") == false)
