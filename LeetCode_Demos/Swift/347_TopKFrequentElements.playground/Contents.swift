class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var frequents = [Int:Int]()
        
        for num in nums {
            if frequents[num] == nil {
                frequents[num] = 1
            } else {
                frequents[num]! += 1
            }
        }
        
        var sortedArray = [(Int, Int)]()
        
        for (num, frequent) in frequents {
            sortedArray.append((num, frequent))
        }
        
        sortedArray.sort { (a, b) -> Bool in
            a.1 > b.1
        }
        
        var result = [Int]()
        
        for num in sortedArray {
            if result.count < k {
                result.append(num.0)
            }
        }
        
        return result
    }
}

let sol = Solution()
sol.topKFrequent([1,1,1,2,2,3], 1)

class Solution2 {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var frequents = [Int:Int]()
        
        for num in nums {
            if frequents[num] == nil {
                frequents[num] = 1
            } else {
                frequents[num]! += 1
            }
        }
        
        var sortedArray = [(Int, Int)]()
        
        for (num, frequent) in frequents {
            sortedArray.append((num, frequent))
        }
        
        sortedArray.sort { (a, b) -> Bool in
            a.1 > b.1
        }
        
        var result = [Int]()
        
        for num in sortedArray {
            if result.count < k {
                result.append(num.0)
            }
        }
        
        return result
    }
}

let sol2 = Solution2()
sol2.topKFrequent([1,1,1,2,2,3], 1)