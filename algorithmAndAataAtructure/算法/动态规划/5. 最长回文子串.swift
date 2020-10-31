//
//  5. 最长回文子串.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/9/11.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/longest-palindromic-substring/

import Foundation

// 1.暴力法，时间复杂度n^3
// 2.动态规划
// 3.中心扩散
// 4.马拉车


// 动态规划
func longestPalindrome(_ s: String) -> String {
    if s.count < 2 {
        return s
    }
    
    let strings = Array(s)
    
    var dp: [[Bool]] = Array(repeating: Array(repeating: false, count: s.count), count: s.count)
    var begin = 0
    var maxLength = 1
    
    for i in (0..<s.count - 1).reversed() {
        for j in i..<s.count {
            let len = j - i + 1
            let isPalindrome = (strings[i] == strings[j]) && (len <= 2 || dp[i + 1][j - 1])
            dp[i][j] = isPalindrome
            if isPalindrome && len > maxLength {
                maxLength = len
                begin = i
            }
        }
    }
    let beginIndex = s.index(s.startIndex, offsetBy: begin)
    let endIndex = s.index(s.startIndex, offsetBy: begin + maxLength)
    return String(s[beginIndex..<endIndex])
}

// 扩展中心
func longestPalindrome1(_ s: String) -> String {
    if s.count < 2 {
        return s
    }

    var begin = 0
    var maxLength = 1

    let cs = s.map { $0 }
    
    for i in (1...s.count - 2).reversed() {
        var len1 = palindromeLength(cs, l: i - 1, r: i + 1)
        let len2 = palindromeLength(cs, l: i, r: i + 1)
        len1 = max(len1, len2)
        if len1 > maxLength {
            maxLength = len1
            begin = i - ((maxLength - 1) >> 1)
        }
    }
    
    if cs[0] == cs[1] && maxLength < 2 {
        maxLength = 2
        begin = 0
    }
    
    let beginIndex = s.index(s.startIndex, offsetBy: begin)
    let endIndex = s.index(s.startIndex, offsetBy: begin + maxLength)
    return String(s[beginIndex..<endIndex])
}

func palindromeLength(_ cs: [Character], l: Int, r: Int) -> Int {
    var char1 = cs[l]
    var char2 = cs[r]
    
    var ll = l
    var rr = r
    
    while ll >= 0 && rr < cs.count && char1 == char2 {
        ll -= 1
        rr += 1
        char1 = cs[ll]
        char2 = cs[rr]
    }
    return rr - ll - 1
}
