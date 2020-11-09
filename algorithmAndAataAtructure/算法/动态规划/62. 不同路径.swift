//
//  62. 不同路径.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/11/3.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/unique-paths/

import Foundation

func uniquePaths(_ m: Int, _ n: Int) -> Int {
    if m == 1 || n == 1 {
        return 1
    }
    var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: m)
    
    dp[0][0] = 1
    // 初始化0行
    for col in 1..<n {
        dp[0][col] = 1
    }
    
    // 初始化0列
    for row in 1..<m {
        dp[row][0] = 1
    }
    
    for row in 1..<m {
        for col in 1..<n {
            dp[row][col] = dp[row - 1][col] + dp[row][col - 1];
        }
    }
    
    return dp[m - 1][n - 1]
}
