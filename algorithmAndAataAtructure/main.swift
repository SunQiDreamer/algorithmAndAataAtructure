//
//  main.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/8/24.
//  Copyright © 2020 孙琦. All rights reserved.
//

import Foundation

let minstack = MinStack1()
minstack.push(2147483646)
minstack.push(2147483646)
minstack.push(2147483647)
print(minstack.top())
minstack.pop()
print(minstack.getMin())
minstack.pop()
print(minstack.getMin())
minstack.pop()
minstack.push(2147483647)
print(minstack.top())
print(minstack.getMin())
minstack.push(-2147483648)
print(minstack.top())
print(minstack.getMin())
minstack.pop()
print(minstack.getMin())

