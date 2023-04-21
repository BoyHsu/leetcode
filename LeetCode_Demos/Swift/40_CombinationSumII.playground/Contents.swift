//: Playground - noun: a place where people can play

import UIKit

class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result = [[Int]]()
        
        var sorted = candidates.sorted()
        
        for var condition in 0..<1 << sorted.count {
            var comb = [Int]()
            var i = 0
            var sum = 0
            
            while condition > 0 {
                if condition & 0b1 == 1 {
                    sum += sorted[i]
                    comb.append(sorted[i])
                }
                condition = condition >> 1
                i += 1
            }
            if sum == target {
//                result.append(comb)
                let isContain = result.contains(where: { (nums) -> Bool in
                    return nums.elementsEqual(comb)
                })
                
                if !isContain {
                    result.append(comb)
                }
            }
        }
        
        return result
    }
}

class Solution1 {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result = [[Int]]()
        var sorted = candidates.sorted()
        for i in 0..<sorted.count {
            if sorted[i] > target {
                sorted.removeSubrange(<#T##bounds: ClosedRange<Int>##ClosedRange<Int>#>)
            }
        }
        print(sorted)
        var conditions = Array.init(repeating: true, count: 1 << sorted.count)
        
        for index in 0..<conditions.count {
            if conditions[index] {
                var condition = index
                
                var comb = [Int]()
                var i = 0
                var sum = 0
                
                while condition > 0 {
                    if condition & 1 == 1 {
                        sum += sorted[i]
                        comb.append(sorted[i])
                    }
                    condition = condition >> 1
                    i += 1
                }
                if sum == target {
                    let isContain = result.contains(where: { (nums) -> Bool in
                        return nums.elementsEqual(comb)
                    })
                    
                    if !isContain {
                        result.append(comb)
                        var upper = index << 1
                        while upper < conditions.count {
                            conditions[upper] = false
                            upper += index
                        }
                    }
                }
            }
        }
        
        return result
    }
}

let sol = Solution1()
print(sol.combinationSum2([1,3,4,6], 5))

