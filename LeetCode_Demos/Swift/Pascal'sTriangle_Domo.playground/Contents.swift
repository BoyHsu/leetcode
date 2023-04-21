//: Playground - noun: a place where people can play

import UIKit

class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        var row = [Int]()
        
        for index in 0 ... rowIndex {
            
            row.append(factorial(row: rowIndex + 1, index: index + 1))
        }
        return row
    }
    
    func factorial(row: Int, index: Int) -> Int {
        if row < 3 || index == 1 || index == row {
            return 1
        }
        return factorial(row: row - 1, index: index - 1) + factorial(row: row - 1, index: index)
    }
    
}

class Solution1 {
    func getRow(_ rowIndex: Int) -> [Int] {
        var result = [[Int]]()
        
        for index in 0 ... rowIndex {
            var row = [Int]()
            for item in 0 ... index {
                if item == 0 || item == index || index < 2 {
                    row.append(1)
                } else {
                    row.append(result[index - 1][item] + result[index - 1][item - 1])
                }
            }
            result.append(row)
        }
        return result[rowIndex]
    }
}

let sol = Solution()
let sol1 = Solution1()

sol.factorial(row: 128, index: 4)

		
