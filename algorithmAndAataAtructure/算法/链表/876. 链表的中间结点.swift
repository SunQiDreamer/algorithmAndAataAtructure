//
//  876. 链表的中间结点.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/9/21.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/middle-of-the-linked-list/

import Foundation

func middleNode(_ head: ListNode?) -> ListNode? {
    if head?.next == nil {
        return head
    }
    
    var fast = head
    var slow = head
    
    var middle: ListNode? = nil
    while fast?.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
        middle = slow
    }
    
    return middle
}
