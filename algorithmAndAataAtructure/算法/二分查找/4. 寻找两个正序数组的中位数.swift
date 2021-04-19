//
//  4. 寻找两个正序数组的中位数.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2021/4/17.
//  Copyright © 2021 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/median-of-two-sorted-arrays/

/*
 给定两个大小分别为 m 和 n 的正序（从小到大）数组 nums1 和 nums2。请你找出并返回这两个正序数组的 中位数 。
 */

import Foundation

// 时间复杂度O(n)
func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    let count = nums1.count + nums2.count
    if count == 0 {
        return 0
    }
    var nums = nums1 + nums2
    nums.sort()
    
    if count % 2 == 0 { // 偶数
        let index1 = (count - 1) / 2
        let index2 = index1 + 1
        return Double((nums[index1] + nums[index2])) / 2
        
    } else {// 奇数
        let index = count / 2
        return Double(nums[index])
    }
}
