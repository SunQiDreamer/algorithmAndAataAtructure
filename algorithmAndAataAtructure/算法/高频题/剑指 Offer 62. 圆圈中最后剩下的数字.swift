//
//  剑指 Offer 62. 圆圈中最后剩下的数字.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/9/15.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/yuan-quan-zhong-zui-hou-sheng-xia-de-shu-zi-lcof/

import Foundation

// 约瑟夫问题  f(n, m) = (f(n - 1, m) + m) % n
func lastRemaining(_ n: Int, _ m: Int) -> Int {
    return (n == 1) ? 0 : (lastRemaining(n - 1, m) + m) % n
}

func lastRemaining1(_ n: Int, _ m: Int) -> Int {
    var res = 0
    for i in 2...n {
        res = (res + m) % i
    }
    return res
}
