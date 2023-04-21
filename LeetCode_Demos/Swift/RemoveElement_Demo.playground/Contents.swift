//: Playground - noun: a place where people can play

import UIKit

class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        
        while let i = nums.index(of: val) {
            nums.remove(at: i)
        }
        
        return nums.count
    }
}

class Solution2 {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        
        let count = nums.count
        var i = 0
        var j = 0
        
        while j < count {
            if nums[j] == val {
                let temp = nums[i]
                nums[i] = nums[j]
                nums[j] = temp
                i += 1
            }
            j += 1
        }
        
        nums.removeSubrange(0 ..< i)
        
        return nums.count
    }
}

class Solution3 {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        
        let count = nums.count
        var i = count
        
        for j in (0..<i).reversed() {
            if nums[j] == val {
                i -= 1
                let temp = nums[i]
                nums[i] = nums[j]
                nums[j] = temp
            }
        }
        
        nums.removeSubrange(i ..< count)
        return nums.count
    }
}

class Solution4 {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        
        let count = nums.count
        var i = 0
        var j = 0
        
        while j < count {
            if nums[j] == val {
                let temp = nums[i]
                nums[i] = nums[j]
                nums[j] = temp
                i += 1
            }
            j += 1
        }
        
        nums.removeSubrange(0 ..< i)
        
        return nums.count
    }
}

let sol = Solution3()
var nums = [1,3,4,5,6,7,6]

sol.removeElement(&nums, 6)
