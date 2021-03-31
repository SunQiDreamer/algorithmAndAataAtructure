//
//  9. 回文数.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/11/10.
//  Copyright © 2020 孙琦. All rights reserved.
//

import Foundation

func isPalindrome(_ x: Int) -> Bool {
    
    var y = x
    
    if y < 0 || (y % 10 == 0 && y != 0) {
        return false
    }
    
    var revertedNumber = 0
    while y > revertedNumber {
        revertedNumber = revertedNumber * 10 + y % 10
        y /= 10
    }
    
    return y == revertedNumber || y == revertedNumber / 10
}
