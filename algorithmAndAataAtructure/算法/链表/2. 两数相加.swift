//
//  2. 两数相加.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/8/26.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/add-two-numbers/

import Foundation

// 构建一个新的链表
func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    if l1 == nil {
        return l2
    }
    
    if l2 == nil {
        return l1
    }
    
    let newHead = ListNode(0) // 虚拟头结点
    var last: ListNode? = newHead  // 构建新链表当前的位置的指针
    
    var carry = 0 // 进位
    
    var newL1 = l1 // 记录遍历到了l1当前位置的指针
    var newL2 = l2 // 记录遍历到了l2当前位置的指针
    
    while newL1 != nil || newL2 != nil {
        var v1: Int = 0
        if newL1 != nil, let val = newL1?.val {
            v1 = val
            newL1 = newL1?.next
        }
        
        var v2: Int = 0
        if newL2 != nil, let val = newL2?.val {
            v2 = val
            newL2 = newL2?.next
        }
        
        let sum = v1 + v2 + carry
        carry = sum / 10
        
        let node = ListNode(sum % 10)
        last?.next = node
        last = last?.next
    }
    
    if carry > 0 {
        last?.next = ListNode(carry)
    }
    return newHead.next
}
