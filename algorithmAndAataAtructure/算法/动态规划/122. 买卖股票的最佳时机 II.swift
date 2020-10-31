//
//  122. 买卖股票的最佳时机 II.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/9/11.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock-ii/

import Foundation

//func maxProfit(_ prices: [Int]) -> Int {
//    if prices.isEmpty {
//        return 0
//    }
//    
//    var minPrice = prices.first ?? 0
//    var maxProfit = 0
//    var day = 0
//    
//    for (index, price) in prices.dropFirst().enumerated() {
//        if price < minPrice {
//            minPrice = price
//        } else {
//            
//            if price - minPrice > maxProfit {
//                day = index + 1
//                maxProfit = price - minPrice
//            }
//        }
//    }
//    return day
//}
