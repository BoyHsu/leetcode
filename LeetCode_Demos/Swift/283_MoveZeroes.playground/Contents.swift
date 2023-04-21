class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var zeroNum = 0
        nums = nums.flatMap({ (num) -> Int? in
            if num == 0 {
                zeroNum += 1
                return nil
            }
            return num
        })
        nums.append(contentsOf: Array.init(repeating: 0, count: zeroNum))
    }
}

class Solution1 {
    func moveZeroes(_ nums: inout [Int]) {
        let count = nums.count
        var i = 0
        
        while i < nums.count {
            if nums[i] == 0 {
                nums.remove(at: i)
                i -= 1
            }
            i += 1
        }
        nums.append(contentsOf: Array.init(repeating: 0, count: count - i))
    }
}

let sol = Solution1()

var nums = [1,0]
sol.moveZeroes(&nums)
print(nums)