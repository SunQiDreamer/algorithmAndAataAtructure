//
//  141. 环形链表.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/9/16.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/linked-list-cycle/

import Foundation

// 快慢指针
func hasCycle(_ head: ListNode?) -> Bool {
    if head == nil {
        return false
    }
    if head === head?.next || head === head?.next?.next {
        return true
    }
    
    var slow = head
    var fast = head?.next
    
    var cycle: Bool = false
    while fast?.next != nil || fast?.next?.next != nil {
        if fast === slow {
            cycle = true
            break
        }
        fast = fast?.next?.next
        slow = slow?.next
    }
    return cycle
}
