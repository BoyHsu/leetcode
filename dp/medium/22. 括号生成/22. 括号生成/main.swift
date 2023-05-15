//
//  main.swift
//  22. 括号生成
//
//  Created by 徐恩 on 2023/5/16.
//

import Foundation

class Solution {
    var res = [String]()
    
    var parentheses = [String]()
    
    func generateParenthesis(_ n: Int) -> [String] {
        genParenthesis(n, n)
        return res
    }
    
    func genParenthesis(_ opening: Int, _ closing: Int) {
        if opening == 0, closing == 0 {
            res.append(parentheses.joined())
            return
        }
        
        if opening > 0 {
            parentheses.append("(")
            genParenthesis(opening-1, closing)
            parentheses.removeLast()
        }
        
        if closing > opening {
            parentheses.append(")")
            genParenthesis(opening, closing-1)
            parentheses.removeLast()
        }
    }
}

let s = Solution()
assert(s.generateParenthesis(3) == ["((()))","(()())","(())()","()(())","()()()"])
s.res = []
s.generateParenthesis(8)
print(s.res)
print("done")

