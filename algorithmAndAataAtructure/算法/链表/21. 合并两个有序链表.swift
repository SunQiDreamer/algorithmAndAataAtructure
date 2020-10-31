//
//  21. 合并两个有序链表.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/9/16.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/merge-two-sorted-lists/

import Foundation

func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    if l1 == nil {
        return l2
    }
    if l2 == nil {
        return l1
    }
    
    var h1 = l1
    var h2 = l2
    let newHead = ListNode(0)
    var cur = newHead
    
    while true {
        var node: ListNode? = nil
        if h1?.val ?? 0 > h2?.val ?? 0 {
            node = ListNode(h2?.val ?? 0)
            cur.next = node
            
            if let node = node {
                cur = node
            }
            
            if let next = h2?.next {
                h2 = next
            } else {
                cur.next = h1
                break
            }
            
        } else {
            node = ListNode(h1?.val ?? 0)
            cur.next = node
            
            if let node = node {
                cur = node
            }
            
            if let next = h1?.next {
                h1 = next
            } else {
                cur.next = h2
                break
            }
        }
    }
    
    return newHead.next
}
