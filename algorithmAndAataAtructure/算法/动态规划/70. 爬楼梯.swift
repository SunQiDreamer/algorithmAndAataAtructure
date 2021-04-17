//
//  70. 爬楼梯.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2021/4/15.
//  Copyright © 2021 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/climbing-stairs/

/*
 假设你正在爬楼梯。需要 n 阶你才能到达楼顶。

 每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？

 注意：给定 n 是一个正整数。
 */

import Foundation

// 斐波那契
func climbStairs(_ n: Int) -> Int {
    if n <= 2 {
        return n
    }
    var dp: [Int] = Array(repeating: 0, count: n + 1)
    dp[1] = 1
    dp[2] = 2
    
    for i in 3...n {
        dp[i] = dp[i - 1] + dp[i - 2]
    }
    return dp[n]
    
}
