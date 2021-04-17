//
//  31. 下一个排列.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2021/4/15.
//  Copyright © 2021 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/next-permutation/

/*
 实现获取 下一个排列 的函数，算法需要将给定数字序列重新排列成字典序中下一个更大的排列。

 如果不存在下一个更大的排列，则将数字重新排列成最小的排列（即升序排列）。

 必须 原地 修改，只允许使用额外常数空间。

 */

import Foundation

func nextPermutation(_ nums: inout [Int]) {
    var i = nums.count - 2
    while i >= 0 && nums[i] >= nums[i + 1] {
        i -= 1
    }
    if i >= 0 {
        var j = nums.count - 1
        while j >= 0 && nums[i] >= nums[j] {
            j -= 1
        }
        nums.swapAt(i, j)
    }
    reverse(&nums, start: i + 1)
}

func reverse(_ nums: inout [Int], start: Int) {
    var left = start, right = nums.count - 1
    while left < right {
        nums.swapAt(left, right)
        left += 1
        right -= 1
    }
}
