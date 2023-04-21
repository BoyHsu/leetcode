class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var i = 0
        
        for j in 1..<nums.count {
            if nums[j] != nums[i] {
                i += 1
                nums[i] = nums[j]
            }
        }
        nums.removeSubrange(i+1..<nums.count)
        return i + 1
    }
}