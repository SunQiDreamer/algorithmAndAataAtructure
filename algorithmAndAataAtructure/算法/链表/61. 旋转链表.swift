//
//  61. 旋转链表.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/11/9.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/rotate-list/

import Foundation

//func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
//
//    if k == 0 || head == nil || head?.next == nil {
//        return head
//    }
//
//    var cur = head
//    var index = head
//    
//    var j = k
//    while j >= 0 {
//        j -= 1
//        if cur?.next != nil {
//            index = cur?.next
//            cur = cur?.next
//        } else {
//            cur = head
//            if head != nil {
//                index = head!
//            }
//        }
//    }
//
//    let nHead = ListNode(cur?.val ?? 0)
//    var begin: ListNode? = nHead
//    if cur?.next != nil {
//        cur = cur?.next
//    } else {
//        cur = head
//    }
//
//
//    while index !== cur {
//        if cur != nil {
//            begin?.next = ListNode(cur?.val ?? 0)
//            begin = begin?.next
//            if cur?.next != nil {
//                cur = cur?.next
//            } else {
//                cur = head
//            }
//
//        } else {
//            begin?.next = ListNode(head?.val ?? 0)
//            begin = begin?.next
//            cur = head?.next
//        }
//    }
//
//    return nHead
//}
