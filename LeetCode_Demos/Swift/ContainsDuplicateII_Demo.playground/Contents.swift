//: Playground - noun: a place where people can play

import UIKit

class Solution {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {

        var set = Set<Int>()
        
        for i in 0..<nums.count {
            if i > k {
                set.remove(nums[i-k-1])
            }
            if set.insert(nums[i]).inserted == false {
                return true
            }
            
        }
        return false
    }
}

let sol = Solution()

sol.containsNearbyDuplicate([1,2,3,1,2,3], 2)
