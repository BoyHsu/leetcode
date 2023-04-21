import UIKit

class Solution {
    func minMoves2(_ nums: [Int]) -> Int {
        var newNums = nums
        
        newNums.sort(by: <)
        print(newNums)
        var i = 0, j = nums.count-1;
        var count = 0;
        while(i < j){
            count += (newNums[j]-newNums[i]);
            i += 1;
            j -= 1;
        }
        return count;
    }
}

let sol = Solution()
sol.minMoves2([2,1])
		
