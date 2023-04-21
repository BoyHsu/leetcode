//
//  main.swift
//  32. Longest Valid Parentheses
//
//  Created by ada_PC007 on 2018/3/19.
//  Copyright © 2018年 AdaTech. All rights reserved.
//

import Foundation

class Solution {
    func longestValidParentheses(_ s: String) -> Int {
        if s.count == 0 {
            return 0
        }
        var start = 0, res = 0
        var stack = [Int]()
        for (i, c) in s.enumerated() {
            if c == "(" {
                stack.append(i)
            } else {
                if stack.count == 0 {
                    stack.removeAll()
                    res = max(i - start, res)
                    start = i+1
                } else {
                    _ = stack.popLast()
                }
            }
        }
        
        if stack.count > 0 {
            stack.append(s.count)
            for i in 0..<stack.count {
                res = max(res, (i == 0 ? stack[0]-start : stack[i] - stack[i-1] - 1))
            }
        } else {
            if start < s.count {
                res = max(s.count - start, res)
            }
        }
        
        return res
    }
}

print(Solution().longestValidParentheses(")(((((()())()()))()(()))("))
print(Solution().longestValidParentheses(")()(((())))("))
