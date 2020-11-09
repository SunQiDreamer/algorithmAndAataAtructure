//
//  剑指 Offer 10- I. 斐波那契数列.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/11/4.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/fei-bo-na-qi-shu-lie-lcof/

import Foundation

func fib(_ n: Int) -> Int {
    if (n<=2) {
        return 1
    }
    return fib(n-1) + fib(n-2)
}


func fib1(_ n: Int) -> Int {
    
    if n <= 0 {
        return 0
    }
    
    if (n<=2) {
        return 1
    }
    
    var array = Array(repeating: 0, count: n + 1)
    array[2] = 1
    array[1] = 1
    return fib2(n, array: &array)
}

func fib2(_ n: Int, array: inout [Int]) -> Int {
    
    if array[n] == 0 {
        array[n] = fib2(n - 1, array: &array) + fib2(n - 2, array: &array)
    }
    return array[n]
}

func fib3(_ n: Int) -> Int {
    if n <= 0 {
        return 0
    }
    
    if (n<=2) {
        return 1
    }
    
    var array = Array(repeating: 0, count: n + 1)
    array[2] = 1
    array[1] = 1
    
    for index in 3...n {
        array[index] = array[index - 1] + array[index - 2]
    }
    return array[n]
}

