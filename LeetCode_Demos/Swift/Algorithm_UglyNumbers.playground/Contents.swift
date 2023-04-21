//: Playground - noun: a place where people can play

import UIKit

class Solution {
    func isUgly(_ num: Int) -> Bool {
        
        if num == 0 {
            return false
        }
        
        var quotient = num
        var remainder: Int
        
        let divisors = [2, 3, 5]
        
        for divisor in divisors {
            while true {
                remainder = quotient % divisor
                
                if quotient == 1 {
                    return true
                }
                if remainder == 0 {
                    quotient /= divisor
                    
                } else {
                    break
                }
            }
        }
        
        return false
    }
}

let solution = Solution()

//for index in 1 ... 100 {
//    print("index >>> \(index) >>> \(solution.isUgly(index))")
//}

solution.isUgly(0)