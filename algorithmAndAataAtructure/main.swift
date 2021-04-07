//
//  main.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/8/24.
//  Copyright © 2020 孙琦. All rights reserved.
//

import Foundation


//let node1 = ListNode(1)
//let node2 = ListNode(2)
//let node3 = ListNode(3)
//let node4 = ListNode(4)
//let node5 = ListNode(5)
//
//node1.next = node2
//node2.next = node3
//node3.next = node4
//node4.next = node5

//var head = reverseList2(node1)

//while head != nil {
//    print(head?.val ?? 0)
//    print("-->")
//    head = head?.next
//}

let node2 = TreeNode(2, parent: nil)
let node1 = TreeNode(1, parent: node2)
let node3 = TreeNode(3, parent: node2)
let node4 = TreeNode(4, parent: node1)
let node5 = TreeNode(5, parent: node1)


node2.left = node1
node2.right = node3
node1.left = node4
node1.right = node5


print(hasPathSum(node2, 7))
