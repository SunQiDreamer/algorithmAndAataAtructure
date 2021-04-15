//
//  300. 最长上升子序列.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/9/19.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/longest-increasing-subsequence/

/*
 给你一个整数数组 nums ，找到其中最长严格递增子序列的长度。

 子序列是由数组派生而来的序列，删除（或不删除）数组中的元素而不改变其余元素的顺序。例如，[3,6,2,7] 是数组 [0,3,1,6,2,2,7] 的子序列。
 */

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
