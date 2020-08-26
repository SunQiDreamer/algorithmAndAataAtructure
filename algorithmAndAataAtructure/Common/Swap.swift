//
//  Swap.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/8/25.
//  Copyright © 2020 孙琦. All rights reserved.
//

import Foundation

// 交换两个变量的值
func swap<T>(_ a: inout T, b: inout T) {
    (a, b) = (b, a)
}


// 交换数组的两个index
func swap<T>(_ array: inout [T], i: Int, j: Int) {
    let tmp = array[i]
    array[i] = array[j]
    array[j] = tmp
}
