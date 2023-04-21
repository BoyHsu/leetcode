
class Solution {
    func isSelfCrossing(_ x: [Int]) -> Bool {
        let count = x.count
        if count < 4 {
            return false
        }
        for i in 3..<count {
            if x[i-3] >= x[i-1] && x[i-2] <= x[i] {
                return true
            }
            if(i >= 4) {
                if(x[i-1] == x[i-3] && x[i] + x[i-4] >= x[i-2]) {
                    return true
                } // Fifth line meets first line and onward
            }
            if(i >= 5) {
                if(x[i-2] - x[i-4] >= 0 && x[i] >= x[i-2] - x[i-4] && x[i-1] >= x[i-3] - x[i-5] && x[i-1] <= x[i-3]) {
                 return true  // Sixth line crosses first line and onward
                }
            }
        }
        return false
    }
}

let x = [2, 2, 4, 4, 6, 6, 4, 2]

let sol = Solution()
sol.isSelfCrossing(x)


