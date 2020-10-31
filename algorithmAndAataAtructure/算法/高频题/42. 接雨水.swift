//
//  42. 接雨水.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/9/15.
//  Copyright © 2020 孙琦. All rights reserved.
//

import Foundation

// 计算每一根柱子上能存放多少水
// 每一根柱子上放多少水，取决于左边所有柱子的最大值以及右边最大柱子最大值中的最小值  min(leftMaxH, rightMaxH) - curH

func trap(_ height: [Int]) -> Int {
    var water = 0
    if height.count < 3 {
        return water
    }
    
    var leftMaxs: [Int] = Array(repeating: 0, count: height.count)
    var rightMaxs: [Int] = Array(repeating: 0, count: height.count)
    
    for i in 1..<height.count - 1 {
        leftMaxs[i] = max(leftMaxs[i - 1], height[i - 1])
    }
    
    for i in (1..<height.count - 1).reversed() {
        rightMaxs[i] = max(rightMaxs[i + 1], height[i + 1])
    }
    
    for i in 1..<height.count - 1 {
        let low = min(leftMaxs[i], rightMaxs[i])
        
        let item = low - height[i]
        if item > 0 {
            water += item
        }
    }
    
    return water
}


func trap1(_ height: [Int]) -> Int {
    var water = 0
    if height.count < 3 {
        return water
    }
    
    var rightMaxs: [Int] = Array(repeating: 0, count: height.count)
 
    for i in (1..<height.count - 1).reversed() {
        rightMaxs[i] = max(rightMaxs[i + 1], height[i + 1])
    }
    
    var leftMax = 0
    for i in 1..<height.count - 1 {
        leftMax = max(leftMax, height[i - 1])
        let low = min(leftMax, rightMaxs[i])
        
        let item = low - height[i]
        if item > 0 {
            water += item
        }
    }
    
    return water
}
