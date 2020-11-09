//
//  Stack.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/8/26.
//  Copyright © 2020 孙琦. All rights reserved.
//

import Foundation

class Stack<T> {
    
    private var array: [T] = []
    
    func push(_ x: T) {
        array.append(x)
    }
    
    @discardableResult
    func pop() -> T {
        return array.removeLast()
    }
    
    func top() -> T? {
        return array.last
    }
    
    func isEmpty() -> Bool {
        array.isEmpty
    }
    
    func size() -> Int {
        array.count
    }
}
