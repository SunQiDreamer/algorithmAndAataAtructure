//
//  977. 有序数组的平方.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/8/25.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/squares-of-a-sorted-array/

import Foundation

func sortedSquares(_ A: [Int]) -> [Int] {
     let array = A.map { (value) -> Int in
        value * value
     }.sorted {
        $0 <= $1
     }
    return array
}
