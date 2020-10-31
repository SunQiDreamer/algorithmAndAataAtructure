//
//  164. 最大间距.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/8/25.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/maximum-gap/

import Foundation


// 时间复杂度是O(nlogn)， 没有达到要求的O(n)
func maximumGap(_ nums: [Int]) -> Int {
    if nums.count < 2 {
        return 0
    }
    
    let array = nums.sorted()
    var maximumGap = 0
    
    for i in 1..<array.count {
        maximumGap = max(maximumGap, array[i] - array[i - 1])
    }
    return maximumGap
}
