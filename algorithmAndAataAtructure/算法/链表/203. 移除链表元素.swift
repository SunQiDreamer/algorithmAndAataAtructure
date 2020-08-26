//
//  203. 移除链表元素.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/8/25.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/remove-linked-list-elements/

import Foundation

// 设置虚拟头结点
func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
    // 想像成构建一个全新的链表
    guard head != nil else {
        return nil
    }
    
    var cur = head
    
    let newHead = ListNode(0)
    var newTail = newHead
    
    while cur != nil {
        if cur?.val != val {
            newTail.next = cur
            if let cur = cur {
                newTail = cur
            }
        }
        cur = cur?.next
    }
    newTail.next =  nil
    return newHead.next
}


// 没有设置虚拟头结点
func removeElements1(_ head: ListNode?, _ val: Int) -> ListNode? {
    // 想像成构建一个全新的链表
    guard head != nil else {
        return nil
    }
    var cur = head
    
    var newHead: ListNode? = nil
    var newTail: ListNode? = nil
    
    while cur != nil {
        if cur?.val != val {
            
            if newTail == nil {
                newHead = cur
                newTail = cur
            } else {
                newTail?.next = cur
                if let cur = cur {
                    newTail = cur
                }
            }
        }
        cur = cur?.next
    }
    newTail?.next =  nil
    return newHead
}
