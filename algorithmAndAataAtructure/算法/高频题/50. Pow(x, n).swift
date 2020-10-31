//
//  50. Pow(x, n).swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/9/14.
//  Copyright © 2020 孙琦. All rights reserved.
//

import Foundation

// 递归
func myPow(_ x: Double, _ n: Int) -> Double {
    if n == 0 {
        return 1
    }
    if n == -1 {
        return 1 / x
    }
    
    var half = myPow(x, n >> 1)
    half *= half
    
    // 是否为奇数
    let odd = (n & 1 == 1)
    return odd ? half * x : half
}

// 非递归，快速幂
func myPow1(_ x: Double, _ n: Int) -> Double {
    var y = n < 0 ? -n : n
    var z = x
    var res = 1.0
    while y > 0 {
        if y & 1 == 1 {
            res *= z
        }
        z *= z
        y >>= 1
    }
    return (n < 0) ? (1 / res) : res
}
