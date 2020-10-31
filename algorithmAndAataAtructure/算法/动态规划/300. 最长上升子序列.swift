//
//  300. 最长上升子序列.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/9/19.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/longest-increasing-subsequence/

import Foundation

// 动态规划
func lengthOfLIS(_ nums: [Int]) -> Int {
    if nums.count == 0 {
        return 0
    }
    
    var dp: [Int] = Array(repeating: 1, count: nums.count)
    var maxValue = dp[0]
    
    for i in 0..<nums.count {
        for j in (0..<i).reversed() {
            if nums[j] < nums[i] {
                dp[i] = max(dp[i], dp[j] + 1)
            }
            maxValue = max(maxValue, dp[i])
        }
    }
    return maxValue
}
