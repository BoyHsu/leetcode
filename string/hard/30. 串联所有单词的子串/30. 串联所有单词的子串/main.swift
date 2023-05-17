//
//  main.swift
//  30. 串联所有单词的子串
//
//  Created by 徐恩 on 2023/5/17.
//

import Foundation

class Solution {
    func findSubstring(_ s: String, _ words: [String]) -> [Int] {
        let n = words.count
        guard n > 0 else { return [] }
        let m = words[0].count
        guard m > 0 else { return [] }
        var wordCounts = [String: Int]()
        for word in words {
            wordCounts[word] = (wordCounts[word] ?? 0) + 1
        }
        
        var res = [Int]()
        let s = Array(s).map({ String($0) })
        let upper = s.count - n*m
        for i in 0..<m {
            var j = i
            var k = j
            var tempWordCounts = wordCounts
            while j <= upper {
                
                while k - j < n*m {
                    let sub = s[k..<k+m].joined()
                    if let count = tempWordCounts[sub], count > 0 {
                        tempWordCounts[sub] = count - 1
                    } else {
                        break
                    }
                    k += m
                }
                
                if k - j == n*m {
                    res.append(j)
                    tempWordCounts[s[j..<j+m].joined()] = 1
                    j += m
                } else {
                    j += m
                    k = j
                    tempWordCounts = wordCounts
                }
            }
        }
        return res
    }
}

let s = Solution()
assert(s.findSubstring("aaaaaaaaaaaaaa", ["aa","aa"]) == [0,1,2,3,4,5,6,7,8,9,10])
assert(s.findSubstring("wordgoodgoodgoodbestword", ["word","good","best","good"]) == [8])
assert(s.findSubstring("barfoothefoobarman", ["foo","bar"]) == [0,9])
assert(s.findSubstring("wordgoodgoodgoodbestword", ["word","good","best","word"]) == [])
assert(s.findSubstring("barfoofoobarthefoobarman", ["bar","foo","the"]) == [6,9,12])
assert(s.findSubstring("barfoobarfoo", ["foo","bar"]) == [0, 3, 6])
assert(s.findSubstring("barfoobarfooa", ["foo","bar"]) == [0, 3, 6])
assert(s.findSubstring("abarfoobarfoo", ["foo","bar"]) == [1, 4, 7])

print("done")

