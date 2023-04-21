//
//  main.swift
//  22. Generate Parentheses
//
//  Created by ada_PC007 on 2017/5/17.
//  Copyright © 2017年 ada56. All rights reserved.
//

import Foundation

class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var ir = [[Int]()], sr = [String]()
        
        for i in 1...n {
            for _ in 0..<ir.count {
                let a = ir.remove(at: 0)
                for j in 0...a.count {
                    var b = a
                    b.insert(i, at: j)
                    ir.append(b)
                }
            }
        }

        for var i in ir {
            var chars = [Character](), s = [0]
            var valid = true
            var index = 1
            
            while !i.isEmpty {
                if i.last! < s.last! {
                    valid = false
                    break
                }
                s.append(index)
                chars.append("(")
                
                while i.last == s.last {
                    i.removeLast()
                    s.removeLast()
                    chars.append(")")
                }
                
                index+=1
            }
            if valid {
                sr.append(String(chars))
            }
        }
        
        return sr
    }
}

class Solution1 {
    func generateParenthesis(_ n: Int) -> [String] {
        var result = [String]()
        dfs([], n, 0, n, &result)
        return result
    }
    func dfs(_ chars: [Character], _ total: Int, _ lLeft: Int, _ rRemainCo: Int, _ result: inout [String]) {
        if rRemainCo == 1 && total == lLeft {
            var r = String(chars)
            r.append(")")
            result.append(r)
            return
        }
        var mChars = chars
        if lLeft < total {
            mChars.append("(")
            dfs(mChars, total, lLeft+1, rRemainCo, &result)
            mChars.removeLast()
        }
        
        if total - lLeft < rRemainCo {
            mChars.append(")")
            dfs(mChars, total, lLeft, rRemainCo-1, &result)
        }
    }
}

class Solution2 {
    func generateParenthesis(_ n: Int) -> [String] {
        var result = [String](), queue = [[Character]()]
        for i in 1...n {
            for _ in queue {
                var chars = queue.remove(at: 0)
                chars.append("(")
                
                for j in 0...2*i-chars.count {
                    var chars1 = chars
                    chars1.append(contentsOf: Array(repeating: ")", count: j))
                    queue.append(chars1)
                }
            }
        }
        
        for i in queue {
            if i.count == n<<1 {
                result.append(String(i))
            }
        }
        

        return result
    }
}

print(Solution2().generateParenthesis(3))
