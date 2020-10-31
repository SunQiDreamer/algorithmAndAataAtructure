//
//  283. 移动零.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/9/14.
//  Copyright © 2020 孙琦. All rights reserved.
//

import Foundation

func moveZeroes(_ nums: inout [Int]) {
    var cur = 0
    for (i, value) in nums.enumerated() {
        if value != 0 && cur != i {
            // 交换cur 和 i 的值
            nums[cur] = nums[i]
            nums[i] = 0
            cur += 1
        }
        
        if nums[cur] != 0 {
            cur += 1
        }
  
    }
}
