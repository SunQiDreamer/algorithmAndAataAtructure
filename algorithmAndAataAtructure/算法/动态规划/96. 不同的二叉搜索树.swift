//
//  96. 不同的二叉搜索树.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2021/4/15.
//  Copyright © 2021 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/unique-binary-search-trees/

/*
 给定一个整数 n，求以 1 ... n 为节点组成的二叉搜索树有多少种？
 */

import Foundation

/* ...i-3, i-2, i-1, (i), i+1, i+2...
 选取i为root, 则这个root可以组成 dp[i - 1] * dp[n - i] 种
 依次选取1...n作为搜索二叉树的root
 dp数组存放n为i时，可以组成搜索二叉树的数量
 
 dp[0] = 1
 dp[1] = 1
 dp[2] = dp[1] + dp[1] = 2
 dp[3] = dp[2] + dp[1] * dp[1] + dp[2] = 5
 dp[4] = dp[3] + dp[1] * dp[2] + dp[2] * dp[1] + dp[3] = 14
 dp[5] = 42
 
 dp[i] = dp[i - 1] + dp[1] * dp[i - 2] + ... + dp[i - 2] * dp[1] + dp[i - 1]
 ...
 
 */

func numTrees(_ n: Int) -> Int {
    if n <= 1 {
        return 1
    }
    
    var dp: [Int] = Array(repeating: 0, count: n + 1)
    dp[0] = 1
    dp[1] = 1
    
    for i in 2...n {
        for j in 1...i {
            dp[i] += dp[j - 1] * dp[i - j]
        }
    }
    return dp[n]
}

// 数学公式
func numTrees1(_ n: Int) -> Int {
    var c = 1
    for i in 0..<n {
        c = c * 2 * (2 * i + 1) / (i + 2)
    }
    return c
}
