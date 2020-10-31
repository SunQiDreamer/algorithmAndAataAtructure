//
//  46. 全排列.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/9/12.
//  Copyright © 2020 孙琦. All rights reserved.
//

import Foundation

class 全排列 {
    var n: [Int] = []
    var list: [[Int]] = []
    var array: [Int] = []
    var used: [Bool] = []

    func permute(_ nums: [Int]) -> [[Int]] {
        if (nums.count == 0) {
            return []
        }
        
        n = nums
        
        array = Array(repeating: -1, count: nums.count)
        used = Array(repeating: false, count: nums.count)

        dfs(0)
        return list
    }
    
    func dfs(_ index: Int) {
        if index == n.count {
            list.append(array)
            return
        }
        
        for (i, value) in n.enumerated() {
            if used[i] {
                continue
            } else {
                array[index] = value
                used[i] = true
                dfs(index + 1)
                used[i] = false
            }
        }
    }
}
