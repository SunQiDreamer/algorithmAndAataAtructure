//
//  剑指 Offer 22. 链表中倒数第k个节点.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/11/9.
//  Copyright © 2020 孙琦. All rights reserved.
//

import Foundation

func getKthFromEnd(_ head: ListNode?, _ k: Int) -> ListNode? {

    var newHead: ListNode? = nil
    var cur: ListNode?
    
    var fast = newHead
    var slow = newHead
    var new = k
    
    while slow?.next != nil {
        fast = fast?.next
        
        if new == 0 {
            slow = slow?.next
            
            newHead = ListNode(0)
            newHead?.next = head
            cur = newHead
        } else if new < 0 {
            slow = slow?.next
            
            cur?.next = ListNode(slow?.val ?? 0)
            cur = cur?.next
        } else {
            new -= 1
        }
    }
    slow?.next = slow?.next?.next
    return newHead?.next
    
}
