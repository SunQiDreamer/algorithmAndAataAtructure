//
//  6. Z 字形变换.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2021/4/19.
//  Copyright © 2021 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/zigzag-conversion/
/*
 将一个给定字符串 s 根据给定的行数 numRows ，以从上往下、从左到右进行 Z 字形排列。

 比如输入字符串为 "PAYPALISHIRING" 行数为 3 时，排列如下：

 P   A   H   N
 A P L S I I G
 Y   I   R
 之后，你的输出需要从左往右逐行读取，产生出一个新的字符串，比如："PAHNAPLSIIGYIR"。

 请你实现这个将字符串进行指定行数变换的函数：

 string convert(string s, int numRows);

 */

import Foundation

func convert(_ s: String, _ numRows: Int) -> String {
    if numRows == 1 {
        return s
    }
    
    var rows: [String] = Array(repeating: "", count: min(numRows, s.count))

    var curRow = 0
    var goingDown = false
    
    for c in Array(s) {
        rows[curRow].append(c)
        if (curRow == 0 || curRow == numRows - 1) {
            goingDown = !goingDown
        }
        
        if goingDown {
            curRow += 1
        } else {
            curRow += -1
        }
    }
    var ret = ""
    for row in rows {
        ret.append(row)
    }
    return ret
}

