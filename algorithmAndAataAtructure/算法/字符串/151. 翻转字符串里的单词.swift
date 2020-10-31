//
//  151. 翻转字符串里的单词.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/9/9.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/reverse-words-in-a-string/

import Foundation

func reverseWords(_ s: String) -> String {
    return s.split { $0.isWhitespace }.reversed().joined(separator: " ")
}

//func reverseWords(_ s: String) -> String {
//    let (string, length) = deleteSpace(s)
//    var ss = reversed(s: string, li: 0, ri: length)
//
//    var prevSpaceIdx = -1
//    for (index, char) in ss.enumerated() {
//        if char != " " {
//            continue
//        }
//        ss = reversed(s: ss, li: prevSpaceIdx + 1, ri: index)
//        prevSpaceIdx = index
//    }
//
//    ss = reversed(s: ss, li: prevSpaceIdx + 1, ri: length)
//    return ss
//}
//
//func deleteSpace(_ s: String) -> (String, Int) {
//    var len = 0
//    var cur = 0
//    var space = true
//    var string = ""
//
//    for char in s {
//
//        if char != " " {
//            // 这一个不是空格
//            cur += 1
//            string.append(char)
//            space = false
//
//        } else if (!space) {
//            // 上一个不是空格
//            cur += 1
//            string.append(" ")
//            space = true
//
//        }
//    }
//
//    len = space ? cur - 1 : cur
//
//
//    if string.last == " " {
//        string.removeLast()
//    }
//
//    return (string, len)
//}
//
//
///// 将[li, ri)范围内的字符串进行逆序
//func reversed(s: String, li: Int, ri: Int) -> String {
//    var l = li
//    var r = ri
//
//    r -= 1
//
//    var c = s.map { $0 }
//    while l < r {
//        (c[l], c[r]) = (c[r], c[l])
//        l += 1
//        r -= 1
//    }
//
//    return String(c)
//}
