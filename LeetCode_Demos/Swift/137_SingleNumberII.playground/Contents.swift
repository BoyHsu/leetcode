class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        
        var mutNums = nums.sorted()
        
        var i = 0, j = 1
        
        while j < nums.count {
            if mutNums[i] != mutNums[j] {
                if i == j - 1 {
                    return mutNums[i]
                }
                i = j
            }
            j += 1
        }
        
        
        return mutNums.last!
    }
}

let sol = Solution()
sol.singleNumber([43,16,45,89,45,-2147483648,45,2147483646,-2147483647,-2147483648,43,2147483647,-2147483646,-2147483648,89,-2147483646,89,-2147483646,-2147483647,2147483646,-2147483647,16,16,2147483646,43])

		