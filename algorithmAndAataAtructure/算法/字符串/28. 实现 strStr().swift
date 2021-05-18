//
//  28. 实现 strStr().swift
//  algorithmAndAataAtructure
//
<<<<<<< HEAD
//  Created by 孙琦 on 2021/4/20.
//  Copyright © 2021 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/implement-strstr/

/*
 实现 strStr() 函数。

 给你两个字符串 haystack 和 needle ，请你在 haystack 字符串中找出 needle 字符串出现的第一个位置（下标从 0 开始）。如果不存在，则返回  -1 。
 */

import Foundation

// KMP
func strStr(_ haystack: String, _ needle: String) -> Int {
    let n = haystack.count
    let m = needle.count
    
    let pi: [Int] = Array(repeating: 0, count: m)
    
    
    
=======
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
>>>>>>> 8d5b903c516b1b262f141c6de3b00ae2b88c09be
}
