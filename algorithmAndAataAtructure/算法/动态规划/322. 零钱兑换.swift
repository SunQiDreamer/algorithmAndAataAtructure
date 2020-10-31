//
//  322. 零钱兑换.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/9/18.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/coin-change/

import Foundation

// 暴力递归
func coinChange(_ coins: [Int], _ amount: Int) -> Int {
    let innerCoins = coins.sorted()
    if amount < innerCoins.first ?? 0 {
        return -1
    }
    return coinChange_(innerCoins, amount)
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
    
    var dp: [Int] = Array(repeating: -1, count: amount + 1)
    
    for coin in coins {
        if coin < amount {
            dp[coin] = 1
        }
    }
    
    let count = coinChange1(coins, amount, dp: &dp)
    return (count == Int.max) ? -1 : count
}

func coinChange1(_ coins: [Int], _ amount: Int, dp: inout [Int]) -> Int {
    if amount < 1 {
        return Int.max
    }
    var minCount = Int.max
    if dp[amount] == -1 {
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
