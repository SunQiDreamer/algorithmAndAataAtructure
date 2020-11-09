//
//  剑指 Offer 18. 删除链表的节点.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/11/9.
//  Copyright © 2020 孙琦. All rights reserved.
//

import Foundation

func deleteNode(_ head: ListNode?, _ val: Int) -> ListNode? {
    
    let newHead = ListNode(-1)
    newHead.next = head
    
    var last: ListNode? = newHead
    var cur: ListNode? = head
    
    while cur != nil {
        if cur?.val == val {
            last?.next = cur?.next
        }
        last = cur
        cur = cur?.next
    }
    return newHead.next
}
