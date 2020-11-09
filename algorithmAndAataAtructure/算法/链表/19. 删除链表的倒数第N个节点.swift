//
//  19. 删除链表的倒数第N个节点.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/11/9.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/remove-nth-node-from-end-of-list/

import Foundation

func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    
    let newHead: ListNode? = ListNode(0)
    newHead?.next = head
    
    var fast = newHead
    var slow = newHead
    var new = n
    
    while fast?.next != nil {
        fast = fast?.next
        if new <= 0 {
            slow = slow?.next
        } else {
            new -= 1
        }
    }
    slow?.next = slow?.next?.next
    return newHead?.next
}
