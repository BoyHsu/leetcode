class Solution {
    func wiggleMaxLength(_ nums: [Int]) -> Int {
        var i = 0
        var j = i + 1
        
        var times = nums.count
        
        var isPosi = nums[0] < nums[j]
        
        while j < nums.count {
            if (nums[i] < nums[j]) == isPosi {
                i = j
                isPosi = !isPosi
            } else {
                times -= 1
            }
            j += 1
        }
        
        return times
    }
}

let sol = Solution()
sol.wiggleMaxLength([1,7,4,9,2,5])

(0>1) == false