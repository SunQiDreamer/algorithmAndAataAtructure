//
//  121. 买卖股票的最佳时机.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/9/11.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock/

/*
 给定一个数组 prices ，它的第 i 个元素 prices[i] 表示一支给定股票第 i 天的价格。

 你只能选择 某一天 买入这只股票，并选择在 未来的某一个不同的日子 卖出该股票。设计一个算法来计算你所能获取的最大利润。

 返回你可以从这笔交易中获取的最大利润。如果你不能获取任何利润，返回 0 。
 */

import Foundation

func maxProfit(_ prices: [Int]) -> Int {
    if prices.isEmpty {
        return 0
    }
    
    var minPrice = prices.first ?? 0
    var maxProfit = 0
    
    for price in prices.dropFirst() {
        if price < minPrice {
            minPrice = price
        } else {
            maxProfit = max(price - minPrice, maxProfit)
        }
    }
    return maxProfit
}

// 解法二，动态规划，求最大连续子序列和
func maxProfit1(_ prices: [Int]) -> Int {
    if prices.isEmpty {
        return 0
    }
    if prices.count == 1 {
        return 0
    }
    var dp = prices[1] - prices.first!
    var maxProfit = dp
    var lastPrice = prices[1]
    
    for price in prices.dropFirst() {
        if dp > 0 {
            dp = dp + price - lastPrice
        } else {
            dp = price - lastPrice
        }
        lastPrice = price
        maxProfit = max(maxProfit, dp)
    }
    return maxProfit
}
