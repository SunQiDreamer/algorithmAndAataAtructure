//
//  239. 滑动窗口最大值.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/8/26.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/sliding-window-maximum/

import Foundation

func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
    if nums.count == 0  || k < 1 {
        return []
    }
    
    if k == 1 {
        return nums
    }
    
    var maxes: [Int] = []
    
    return []
}
