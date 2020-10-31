//
//  面试题 01.09. 字符串轮转.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/8/27.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/string-rotation-lcci/

import Foundation

func isFlipedString(_ s1: String, _ s2: String) -> Bool {
    
    if s1 == "" && s2 == "" {
        return true
    }
    
    if s1.count != s2.count {
        return false
    }
    
    return (s1 + s1).contains(s2)
}
