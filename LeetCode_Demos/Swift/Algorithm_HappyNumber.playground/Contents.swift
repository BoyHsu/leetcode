//: Playground - noun: a place where people can play

import UIKit

class Solution {
    func isHappy(_ n: Int) -> Bool {
        var set: Set<Int> = []
        var result: Int = n
        var shouldStop = false
        
        while shouldStop != true {
            result = squareSum(result)
            shouldStop = !set.insert(result).inserted
        }
        
        return result == 1
    }
    
    func squareSum(_ n: Int) -> Int {
        var sum: Int = 0
        var varN = n
        
        while varN != 0 {
            let quotient = varN / 10
            let remaider = varN % 10
            
            sum += remaider * remaider
            varN = quotient
        }
        return sum
    }
}

let solution = Solution()
solution.isHappy(1111111)
    