//
//  160. 相交链表.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/8/26.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/intersection-of-two-linked-lists/

import Foundation

func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
    // 拼接两个链表（链表a后再拼接链表b，链表b后面再拼接链表a），两个指针分别在两个链表头结点依次遍历两个链表，当两个指针指向的节点是同一个时，就是相交节点
    if headA == nil || headB == nil {
        return nil
    }
    
    var curA = headA, curB = headB
    
    while curA !== curB {
        if curA == nil {
            // 链表a遍历完了，指向链表b头结点
            curA = headB
        } else {
            curA = curA?.next
        }
        
        if curB == nil {
            // 链表b遍历完了，指向链表a头结点
            curB = headA
        } else {
            curB = curB?.next
        }
        
        
        // 会死循环（连个链表没有相交节点时）
//        if curA.next == nil {
//            curA = headB
//        } else {
//            curA = curA?.next
//        }
//
//        if curB.next == nil {
//            curB = headA
//        } else {
//            curB = curB?.next
//        }
        
    }
    
    return curA
}
