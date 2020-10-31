//
//  83. 删除排序链表中的重复元素.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/9/21.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/remove-duplicates-from-sorted-list/

import Foundation

func deleteDuplicates(_ head: ListNode?) -> ListNode? {
    if head == nil || head?.next == nil {
        return head
    }
    
    var cur = head?.next
    var lastNode = head
    
    while cur != nil {
        if lastNode?.val == cur?.val {
            lastNode?.next = cur?.next
        } else {
            lastNode = cur!
        }
        
        cur = cur?.next
    }
    return head
}
