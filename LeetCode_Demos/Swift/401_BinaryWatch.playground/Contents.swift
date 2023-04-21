import UIKit

class Solution {
    
    func readBinaryWatch(_ num: Int) -> [String] {
        var times = [String]()
        
        for hour in 0 ..< 12 {
            for min in 0 ..< 60 {
                if integerBitCount(num: hour * 64 + min) == num {
                    times.append("\(hour):\(min<10 ? "0" : "")\(min)")
                }
            }
        }
        return times
    }
    
    func integerBitCount(num: Int) -> Int {
        var bitCount = 0
        var mNum = num
        
        while mNum != 0 {
            if mNum & 0b1 == 1 {
                bitCount += 1
            }
            mNum /= 2
        }
        
        return bitCount
    }
}

let sol = Solution()
sol.readBinaryWatch(0)
		
