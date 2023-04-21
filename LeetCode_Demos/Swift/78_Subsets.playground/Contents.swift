class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        let count = nums.count
        
        for index in 0 ..< 1 << count {
            var subset = [Int]()
            var mutI = index
            var time = 0
            
            while time < count {
                time += 1
                if mutI & 1 == 1 {
                    subset.append(nums[count - time])
                }
                mutI = mutI >> 1
            }
            result.append(subset)
        }
        return result
    }
}

let sol = Solution()

class Solution2 {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        let count = nums.count
        
        for combination in 0 ..< 1 << count {
            var subset = nums
            var mutI = combination
            var time = 0, index = 0
            
            while mutI > 0 {
                if mutI % 2 == 1 {
                    subset[time] = nums[index]
                    time += 1
                }
                index += 1
                mutI /= 2
            }
            subset.removeSubrange(time ..< count)
            result.append(subset)
        }
        return result
    }
}

let sol2 = Solution2()
print(sol2.subsets([1,2,4]))
		