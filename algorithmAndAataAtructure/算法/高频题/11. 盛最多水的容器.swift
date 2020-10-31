//
//  11. 盛最多水的容器.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/9/15.
//  Copyright © 2020 孙琦. All rights reserved.
//

import Foundation

func maxArea(_ height: [Int]) -> Int {
    if height.count == 0 {
        return 0
    }
    
    var l = 0
    var r = height.count - 1
    var area = 0
    
    while l < r {
        
        let minH = min(height[l], height[r])
        area = max(area, minH * (r - l))
        
        while l < r && height[l] <= minH {
            l += 1
        }
        
        while l < r && height[r] <= minH {
            r -= 1
        }
    }
    
    return area
}
