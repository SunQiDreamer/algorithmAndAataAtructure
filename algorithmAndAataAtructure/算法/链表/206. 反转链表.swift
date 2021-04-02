//
//  206. 反转链表.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/9/16.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/reverse-linked-list/

import Foundation

class reverseListxxx {
    // 迭代
    func reverseList1(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        var cur = head?.next
        var newHead = head
        var tmp = cur?.next
        newHead?.next = nil
        
        while cur != nil {
            cur?.next = newHead
            
            newHead = cur
            cur = tmp
            tmp = tmp?.next
            
        }
        
        return newHead
    }

    // 递归
    func reverseList2(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        let newHead = reverseList2(head?.next)
        // 翻转当前这个节点
        head?.next?.next = head
        head?.next = nil
        
        return newHead
    }
}

// 迭代，头插法
func reverseList3(_ head: ListNode?) -> ListNode? {
    if head == nil || head?.next == nil {
        return head
    }
    
    let newHead: ListNode? = ListNode(0)
    var cur = head
    var tmp = newHead?.next
    
    while cur != nil {
        tmp = newHead?.next
        let newNode = ListNode(cur?.val ?? 0)
        newHead?.next = newNode
        newNode.next = tmp
        cur = cur?.next
    }
    return newHead?.next
    
}
