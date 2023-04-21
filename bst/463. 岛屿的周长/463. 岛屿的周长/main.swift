//
//  main.swift
//  463. 岛屿的周长
//
//  Created by 徐恩 on 2023/4/2.
//

import Foundation

class Solution {
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        var visited = Array(repeating: Array(repeating: false, count: grid[0].count), count: grid.count)
        var area = 0
        var queue = [(Int, Int)]()
        
        for i in grid.indices {
            let row = grid[i]
            for j in row.indices {
                if row[j] != 1 || visited[i][j] {
                    continue
                }
                
                visited[i][j] = true
                queue.append((i, j))
                
                while !queue.isEmpty {
                    let (x, y) = queue.removeFirst()
                    var adjs = 0
                    
                    for (x0, y0) in [(x-1, y), (x+1, y), (x, y-1), (x, y+1)] {
                        if x0 >= 0 ,y0 >= 0,
                           x0 < grid.count, y0 < row.count,
                           grid[x0][y0] == 1 {
                            adjs += 1
                            
                            if !visited[x0][y0] {
                                queue.append((x0, y0))
                                visited[x0][y0] = true
                            }
                        }
                    }
                    
                    area += (4 - adjs)
                }
            }
        }
        return area
    }
}

