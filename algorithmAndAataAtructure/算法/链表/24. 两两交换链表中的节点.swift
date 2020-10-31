//
//  24. 两两交换链表中的节点.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/9/16.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/swap-nodes-in-pairs/

import Foundation

// 构建一个新的链表
func swapPairs(_ head: ListNode?) -> ListNode? {
    if head == nil || head?.next == nil {
        return head
    }
    
    var fast = head?.next
    var slow = head
    
    let newHead = ListNode(0)
    var cur = newHead
    
    while fast?.next != nil || fast != nil {
        let newFast = ListNode(fast?.val ?? 0)
        let newSlow = ListNode(slow?.val ?? 0)
        
        cur.next = newFast
        newFast.next = newSlow
        
        cur = newSlow
        
        slow = fast?.next
        fast = slow?.next
        
    }
    
    if slow != nil {
        cur.next = ListNode(slow?.val ?? 0)
    }
    
    return newHead.next
}

// 递归
func swapPairs1(_ head: ListNode?) -> ListNode? {
    if head == nil || head?.next == nil {
        return head
    }
    
    let next = head?.next
    head?.next = swapPairs1(next?.next)
    next?.next = head
    return next
}
