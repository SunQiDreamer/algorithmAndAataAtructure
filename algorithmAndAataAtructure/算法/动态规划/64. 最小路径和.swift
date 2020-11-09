//
//  64. 最小路径和.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/11/3.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/minimum-path-sum/

import Foundation

func minPathSum(_ grid: [[Int]]) -> Int {
    
    if grid.count == 0 {
        return 0
    }
    
    let rows = grid.count
    let cols = grid[0].count
    
    var dp = Array(repeating: Array(repeating: 0, count: cols), count: rows)
    dp[0][0] = grid[0][0]
    
    for row in 1..<rows {
        dp[row][0] = dp[row - 1][0] + grid[row][0]
    }
    
    for col in 1..<cols {
        dp[0][col] = dp[0][col - 1] + grid[0][col]
    }
    
    
    for row in 1..<rows {
        for col in 1..<cols {
            dp[row][col] = min(dp[row - 1][col], dp[row][col - 1]) + grid[row][col]
        }
    }
    
    return dp[rows - 1][cols - 1]
}
