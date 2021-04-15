//
//  322. 零钱兑换.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/9/18.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/coin-change/

/*
 给定不同面额的硬币 coins 和一个总金额 amount。编写一个函数来计算可以凑成总金额所需的最少的硬币个数。如果没有任何一种硬币组合能组成总金额，返回 -1。

 你可以认为每种硬币的数量是无限的。
 */

import Foundation

// 暴力递归
func coinChange(_ coins: [Int], _ amount: Int) -> Int {
    if amount == 0 {
        return 0
    }
    let innerCoins = coins.sorted()
    if amount < innerCoins.first ?? 0 {
        return -1
    }
    let count = coinChange_(innerCoins, amount)
    if count == Int.max {
        return -1
    }
    return count
}

func coinChange_(_ coins: [Int], _ amount: Int) -> Int {
    if amount < coins.first ?? 0 {
        return Int.max
    }
    
    if coins.contains(amount) {
        return 1
    }
    
    var minCount = Int.max
    for coin in coins {
        minCount = min(minCount, coinChange_(coins, amount - coin))
    }
    
    if minCount == Int.max {
        return minCount
    }

    return minCount + 1
}

// 记忆化搜索(自顶向下调用)
func coinChange1(_ coins: [Int], _ amount: Int) -> Int {
    if amount == 0 {
        return 0
    }
    
    let innerCoins = coins.sorted()
    if amount < innerCoins.first ?? 0 {
        return -1
    }
    if innerCoins.contains(amount) {
        return 1
    }
    // dp数组存放的是从0到amount之间的金额，需要几枚硬币
    var dp: [Int] = Array(repeating: -1, count: amount + 1)
    
    for coin in coins {
        if coin < amount {
            dp[coin] = 1
        }
    }
    
    let count = coinChange1(innerCoins, amount, dp: &dp)
    return (count == Int.max) ? -1 : count
}

func coinChange1(_ coins: [Int], _ amount: Int, dp: inout [Int]) -> Int {
    if amount < 1 {
        return Int.max
    }
    var minCount = Int.max
    if dp[amount] == -1 { // 该数额之前还没有计算过
        for coin in coins {
            minCount = min(minCount, coinChange1(coins, amount - coin, dp: &dp))
        }
        if minCount == Int.max || minCount == -1 {
            dp[amount] = -1
        } else {
            dp[amount] = minCount + 1
        }
    }
    return dp[amount]
}

// 动态规划 自底向上
func coinChange2(_ coins: [Int], _ amount: Int) -> Int {
    if amount == 0 {
        return 0
    }
    if amount < 1 || coins.count == 0 {
        return -1
    }
    
    var dp: [Int] = Array(repeating: 0, count: amount + 1)
    for i in 1...amount {
        var min = Int.max
        for coin in coins {
            if i < coin {
                continue
            }
            let v = dp[i - coin]
            if v < 0 || v >= min {
                continue
            }
            min = v
        }
        
        if min == Int.max {
            dp[i] = -1
        } else {
            dp[i] = min + 1
        }
        
    }
    return dp[amount]
}
