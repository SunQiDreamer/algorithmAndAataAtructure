//
//  25. K 个一组翻转链表.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/9/16.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/reverse-nodes-in-k-group/

import Foundation

func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
    if head == nil || head?.next == nil || k < 1 {
        return head
    }
    
    var cur = head
    var cur1 = head
    
    let newHead: ListNode? = ListNode(0)
    var last = newHead
    
    let stack = Stack<Int>()
    
    while cur != nil {
        if stack.size() == k { // 栈满了，翻转栈中的节点
            
            while !stack.isEmpty() {
                let val = stack.pop()
                last?.next = ListNode(val)
                last = last?.next
                cur1 = cur1?.next
            }
            
        } else {
            stack.push(cur?.val ?? 0)
            cur = cur?.next
        }
    }
    
    if stack.size() == k {
        while !stack.isEmpty() {
            let val = stack.pop()
            last?.next = ListNode(val)
            last = last?.next
        }
    } else {
        last?.next = cur1
    }

    return newHead?.next
}
