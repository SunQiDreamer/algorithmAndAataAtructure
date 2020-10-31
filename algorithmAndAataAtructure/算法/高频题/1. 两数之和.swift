//
//  1. 两数之和.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/9/14.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/two-sum/

import Foundation

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    
    var map: [Int: Int] = [:]
    for (index, value) in nums.enumerated() {
        let result = target - value
        if let i = map[result] {
             return [index, i]
        } else {
            map[value] = index
        }
    }
    return []
}

