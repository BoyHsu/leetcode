//
//  main.swift
//  20. 有效的括号
//
//  Created by 徐恩 on 2023/5/15.
//

import Foundation

class Solution {
    func isValid(_ s: String) -> Bool {
        var stack = [Character]()
        
        for c in s {
            switch c {
            case "(", "[", "{": stack.append(c)
            case ")": if stack.popLast() != "(" { return false }
            case "]": if stack.popLast() != "[" { return false }
            case "}": if stack.popLast() != "{" { return false }
            default: break
            }
        }
        
        return true
    }
}

