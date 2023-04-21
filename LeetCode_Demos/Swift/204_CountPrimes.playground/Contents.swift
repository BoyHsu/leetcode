import UIKit

class Solution {
    func countPrimes(_ n: Int) -> Int {
        if n < 3 {
            return 0
        }
        
        var sum = 1
        let sqr = Int(sqrt(Double(n)))
        
        var isPrimes = Array.init(repeating: false, count: n)
        
        var i = 3
        
        while i < n {
            if !isPrimes[i] {
                sum += 1
                if i > sqr {
                    i += 2
                    continue
                }
                var upIndex = i * i
                while upIndex < n {
                    isPrimes[upIndex] = true
                    upIndex += i
                }
            }
            i += 2
        }
        
        return sum
    }
}

class Solution2 {
    func countPrimes(_ n: Int) -> Int {
        if n < 3 {
            return 0
        }
        
        var sum = 1
        let sqr = Int(sqrt(Double(n)))
        
        var isPrimes = Array.init(repeating: false, count: n)
        
        var i = 3
        
        while i < n {
            if !isPrimes[i] {
                sum += 1
                if i > sqr {
                    i += 2
                    continue
                }
                var upIndex = i * i
                while upIndex < n {
                    isPrimes[upIndex] = true
                    upIndex += i
                }
            }
            i += 2
        }
        
        return sum
    }
}