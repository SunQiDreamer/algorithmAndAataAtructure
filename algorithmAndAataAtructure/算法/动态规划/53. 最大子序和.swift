//
//  53. 最大子序和.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/9/18.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/maximum-subarray/

import Foundation

// 暴力法 O(n^3)
func maxSubArray(_ nums: [Int]) -> Int {
    var m = Int32.min
    for i in 0..<nums.count {
        for j in i..<nums.count {
            var result = 0
            for k in i...j {
                result += nums[k]
            }
            m = max(m, Int32(result))
        }
    }
    return Int(m)
}

// 暴力法 O(n^2)
func maxSubArray1(_ nums: [Int]) -> Int {
    var m = Int32.min
    for i in 0..<nums.count {
        var result = 0
        for j in i..<nums.count {
            result += nums[j]
            m = max(m, Int32(result))
        }
    }
    return Int(m)
}

// 分治
func maxSubArray2(_ nums: [Int]) -> Int {
    if nums.count == 0 {
        return 0
    }
   return maxSubArray2(nums, begin: 0, end: nums.count)
}

func maxSubArray2(_ nums: [Int], begin: Int, end: Int) -> Int {
    if end - begin < 2 {
        return nums[begin]
    }
    // 获取中间值
    let mid = (begin + end) >> 1
    
    // 从中间开始往左获取最大子序列
    var leftMax = Int.min
    var leftSum = 0
    for i in (begin..<mid).reversed() {
        leftSum += nums[i]
        leftMax = max(leftMax, leftSum)
    }
    
    // 从中间开始往右获取最大子序列
    var rightMax = Int.min
    var rightSum = 0
    for i in mid..<end {
        rightSum += nums[i]
        rightMax = max(rightMax, rightSum)
    }
    
    // 最大子序列为在左边的最大连续子序列，在右边的最大连续子序列，在中间的最大连续子序列的最大值
    return max(leftMax + rightMax, max(maxSubArray2(nums, begin: begin, end: mid), maxSubArray2(nums, begin: mid, end: end)))
}

// 动态规划
func maxSubArray3(_ nums: [Int]) -> Int {
    if nums.count == 0 {
        return 0
    }
    var dp = nums[0]
    var maxValue = dp
    for i in 1..<nums.count {
        if dp >= 0 {
            dp = dp + nums[i]
        } else {
            dp = nums[i]
        }
        
        maxValue = max(maxValue, dp)
    }
    return maxValue
}
