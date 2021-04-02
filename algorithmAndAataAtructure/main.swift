//
//  main.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/8/24.
//  Copyright © 2020 孙琦. All rights reserved.
//

import Foundation


let node1 = ListNode(1)
let node2 = ListNode(2)
let node3 = ListNode(3)
let node4 = ListNode(5)
let node5 = ListNode(2)

node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5

var head = partition(node1, 3)

while head != nil {
    print(head?.val ?? 0)
    print("-->")
    head = head?.next
}
