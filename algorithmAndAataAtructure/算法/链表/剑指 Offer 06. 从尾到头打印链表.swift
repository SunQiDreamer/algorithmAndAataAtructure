//
//  剑指 Offer 06. 从尾到头打印链表.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/9/21.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/cong-wei-dao-tou-da-yin-lian-biao-lcof/

import Foundation

func reversePrint(_ head: ListNode?) -> [Int] {

    var result: [Int] = []
    var cur = head
    while cur != nil {
        result.append(cur?.val ?? 0)
        cur = cur?.next
    }
    
    return result.reversed()
}
