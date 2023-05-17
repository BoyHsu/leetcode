//
//  main.swift
//  32. 最长有效括号
//
//  Created by 徐恩 on 2023/5/17.
//

import Foundation

class Solution {
    func longestValidParentheses(_ s: String) -> Int {
        var stack = [Int](), map = [Int](repeating: -1, count: s.count)
        let s = Array(s)
        for (i, c) in s.enumerated() {
            if c == "(" {
                stack.append(i)
            } else {
                if !stack.isEmpty, s[stack.last!] == "("  {
                    map[stack.removeLast()] = i
                    map[i] = 0
                } else {
                    map[i] = -1
                }
            }
        }
        var maxLen = 0, len = 0, outerClosing = 0
        for (i, closing) in map.enumerated() {
            if closing == 0 {
                continue
            } else if closing == -1 {
                maxLen = max(maxLen, len)
                len = 0
            } else {
                if closing > outerClosing {
                    outerClosing = closing
                    len += closing - i + 1
                }
            }
        }
        
        maxLen = max(maxLen, len)
        
        return maxLen
    }
}


let s = Solution()
assert(s.longestValidParentheses(")()())") == 4)
assert(s.longestValidParentheses("(()") == 2)
assert(s.longestValidParentheses("()(()") == 2)
print("done")

