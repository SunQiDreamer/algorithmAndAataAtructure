//
//  1290. 二进制链表转整数.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/11/9.
//  Copyright © 2020 孙琦. All rights reserved.
//

import Foundation

func getDecimalValue(_ head: ListNode?) -> Int {

    var cur = head
    var ans = 0
    while cur != nil {
        if let val = cur?.val {
            ans = ans * 2 + val
            cur = cur?.next
        }
    }
    return ans
}
