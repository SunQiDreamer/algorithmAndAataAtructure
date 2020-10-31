//
//  7. 整数反转.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/9/15.
//  Copyright © 2020 孙琦. All rights reserved.
//

import Foundation

func reverse(_ x: Int) -> Int {
    var y = x
    var res = 0
    while y != 0 {
        let n1 = y % 10
        y /= 10
        res  = res * 10 + n1
        if res > Int32.max {
            return 0
        } else if res < Int32.min {
            return 0
        }
    }
    return res
}
