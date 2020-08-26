//
//  75. 颜色分类.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/8/25.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/sort-colors/

import Foundation

func sortColors(_ nums: inout [Int]) {
    
    // 三指针，指针一用于扫描，指针二用于指向开始位置，用于交换0，指针三用于结束位置，用于交换2
    // 扫描的指针扫到0，与开始的指针交换值，扫到2，与尾部的指针交换值
    
    var i = 0 // 指向左边，交换0
    var r = 0 // 用于扫描
    var l = nums.count - 1 // 指向尾部，用于交换2
    
    while r <= l {
        
        let current = nums[r]
        if current == 0 { // 和指针i的值交换
            swap(&nums, i: i, j: r)
            i += 1
            r += 1
            
        } else if current == 1 {
            // 为1时不用交换，直接r+1
            r += 1
            
        } else {
            swap(&nums, i: l, j: r)
            // 不能增加r，因为可能交换回来的也是2，还要再次循环交换
            l -= 1
            
        }
    }
}
