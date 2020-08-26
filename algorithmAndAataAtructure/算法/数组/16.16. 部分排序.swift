//
//  16.16. 部分排序.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/8/25.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/sub-sort-lcci/

import Foundation

func subSort(_ array: [Int]) -> [Int] {
    // 扫描数组找出逆序对，找到最左边的逆序对和最右边的逆序对，返回最左边逆序对的左边元素index和最右边逆序对的右边元素index
    // 双指针
    if array.count == 0 {
        return [-1, -1]
    }
    
    // 遍历查找最右的逆序对
    var r = -1
    var max = array[0]
    for index in 0 ..< array.count {
        if array[index] >= max {
            max = array[index]
        } else {
            r = index
        }
    }
    
    if r == -1 {
        // 说明没有找到逆序对, 提前结束
        return [-1, -1]
    }
 
    // 反向遍历查找最左的逆序对
    var l = -1
    var min = array[array.count - 1]
    for index in (0 ..< array.count).reversed() {
        if array[index] <= min {
            min = array[index]
        } else {
            l = index
        }
    }
    
    return [l, r]
}
