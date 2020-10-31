//
//  121. 买卖股票的最佳时机.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/9/11.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock/

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
