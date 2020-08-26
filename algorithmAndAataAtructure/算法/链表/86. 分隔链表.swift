//
//  86. 分隔链表.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/8/26.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/partition-list/

import Foundation

func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
    if head == nil {
        return head
    }
    var newHead = head
    
    let lessThanHead = ListNode(0)
    var lessThanTail: ListNode? = lessThanHead
    
    let greatThanHead = ListNode(0)
    var greatThaTail: ListNode? = greatThanHead
    
    while newHead != nil {
        if newHead!.val < x {
            lessThanTail?.next = newHead
            lessThanTail = newHead
        } else {
            greatThaTail?.next = newHead
            greatThaTail = newHead
        }
        newHead = newHead?.next
    }
    // 这句代码不能少
    /*
     * 因为可能出现这样的情况:
     * 原链表倒数第N个节点A的值是>=x的，A后面所有节点的值都是<x的
     * 然后rTail.next最终其实就是A.next
     */
    greatThaTail?.next = nil
    lessThanTail?.next = greatThanHead.next
    
    return lessThanHead.next
}
