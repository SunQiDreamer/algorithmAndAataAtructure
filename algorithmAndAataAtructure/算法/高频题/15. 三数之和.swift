//
//  15. 三数之和.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/9/14.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/3sum/

import Foundation

func threeSum(_ nums: [Int]) -> [[Int]] {
    if nums.count < 3 {
        return []
    }
    
    let news = nums.sorted()
    
    var r = 0
    var l = 0
    var results: [[Int]] = []
    
    for i in 0..<news.count {
        // 去重
        if (i > 0 && news[i] == news[i - 1]) {
            continue
        }
        
        l = i + 1
        r = news.count - 1
        
        while l < r {
            let result = news[i] + news[r] + news[l]
            if result > 0 {
                r -= 1
            } else if result < 0 {
                l += 1
            }else {
                let array = [news[i], news[l], news[r]]
                results.append(array)
                // 去重
                while (l < r && news[l] == news[l + 1]) {
                    l += 1
                }
                
                // 去重
                while (l < r && news[r] == news[r - 1]) {
                    r -= 1
                }
                l += 1
            }
        }
    }
    return results
}
