//
//  剑指 Offer 47. 礼物的最大价值.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/9/10.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/li-wu-de-zui-da-jie-zhi-lcof/

import Foundation

func maxValue(_ grid: [[Int]]) -> Int {
    
    if grid.count == 0 {
        return 0
    }
    let rows = grid.count
    let columns = grid.first?.count ?? 0
    
    var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: columns), count: rows)
    
    dp[0][0] = grid[0][0]
    // 初始化0行
    for col in 1..<columns {
        dp[0][col] = dp[0][col - 1] + grid[0][col]
    }
    
    // 初始化0列
    for row in 1..<rows {
        dp[row][0] = dp[row - 1][0] + grid[row][0]
    }
    
    for row in 1..<rows {
        for col in 1..<columns {
            dp[row][col] = max(dp[row - 1][col], dp[row][col - 1]) + grid[row][col];
        }
    }
    
    return dp[rows - 1][columns - 1]
}
