//
//  28. 实现 strStr().swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2021/4/27.
//  Copyright © 2021 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/implement-strstr/

import Foundation

// 蛮力算法
func strStr(_ haystack: String, _ needle: String) -> Int {
    if haystack.isEmpty || needle.isEmpty {
        return -1
    }
    if haystack.count < needle.count {
        return -1
    }
    
    var pi = 0, ti = 0
    while pi < haystack.count && ti < needle.count {
        if chat(at: ti, string: needle) == chat(at: pi, string: haystack)  {
            ti += 1
            pi += 1
        } else {
            ti -= pi - 1
            pi = 0
        }
    }
    return pi == needle.count ? ti - pi : -1
}

func chat(at index: Int, string: String) -> Character? {
    let chars = Array(string)
    let c = chars[index]
    return c
}
