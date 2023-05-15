//
//  main.swift
//  17. 电话号码的字母组合
//
//  Created by 徐恩 on 2023/5/15.
//

import Foundation

class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        guard !digits.isEmpty else { return [] }
        var queue = [""]
        let map: [Character: [String]] = [
            "2": ["a", "b", "c"],
            "3": ["d", "e", "f"],
            "4": ["g", "h", "i"],
            "5": ["j", "k", "l"],
            "6": ["m", "n", "o"],
            "7": ["p", "q", "r", "s"],
            "8": ["t", "u", "v"],
            "9": ["w", "x", "y", "z"]
        ]
        for digit in digits {
            let letters = map[digit]!
            var next = [String]()
            for str in queue {
                for letter in letters {
                    next.append(str+letter)
                }
            }
            queue = next
        }
        return queue
    }
}

