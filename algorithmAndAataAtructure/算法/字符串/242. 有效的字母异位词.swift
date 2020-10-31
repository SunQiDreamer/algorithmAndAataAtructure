//
//  242. 有效的字母异位词.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/9/8.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/valid-anagram/

import Foundation

func isAnagram(_ s: String, _ t: String) -> Bool {
    
    if s.count != t.count {
        return false
    }
    
    var charts: [Character: Int] = [:]
    for chart in s {
        if let num = charts[chart] {
            charts[chart] = num + 1
        } else {
            charts[chart] = 1
        }
    }
    
    for chart in t {
        if let num = charts[chart] {
            if num == 0 {
                return false
            } else {
                charts[chart] = num - 1
            }
        } else {
            return false
        }
    }
    return true
}
