//
//  3. 无重复字符的最长子串.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/9/10.
//  Copyright © 2020 孙琦. All rights reserved.
//

import Foundation

func lengthOfLongestSubstring(_ s: String) -> Int {
    if s.isEmpty {
        return 0
    }
    
    var prevIndex: [Int] = Array(repeating: -1, count: 128)

    if let ascii = s.first?.asciiValue {
        prevIndex[Int(ascii)] = 0
    }
    var li = 0 // 遍历到的字符前一个字符的最大无重复子串的开始索引
    var maxLength = 1 // 最大无重复字符的长度
    for (index, char) in s.dropFirst().enumerated() {
        if let ascii = char.asciiValue {
            let pi = prevIndex[Int(ascii)]
            
            if li <= pi {
                li = pi + 1
            }
            prevIndex[Int(ascii)] = index + 1
            maxLength = max(maxLength, index - li + 2)
        }  
    }
    return maxLength
}
