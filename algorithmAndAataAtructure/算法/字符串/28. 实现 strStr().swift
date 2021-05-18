//
//  28. 实现 strStr().swift
//  algorithmAndAataAtructure
//
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
    
    
    
}
