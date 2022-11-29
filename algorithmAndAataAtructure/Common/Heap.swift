//
//  Heap.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2022/11/29.
//  Copyright © 2022 孙琦. All rights reserved.
//

import Foundation

class Heap<T: Comparable> {
    private var a: [T] = []
    private let capacity: Int
    private var count: Int = 0
    
    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    func insert(_ data: T) {
        guard count < capacity else {
            return
        }
        
        count = count + 1
        a[count] = data
        var i = count
        while i/2 > 0 && a[i] > a[i/2] {
            swap(&a, i: i, j: i/2)
            i = i/2
        }
    }
    
    func removeMax() {
        if count == 0 {
            return
        }
        a[1] = a[count]
        count = count - 1
        heapify(n: count, i: 1)
    }
    
    private func heapify(n: Int, i: Int) {
        var tmp = i
        while true {
            var maxPos = tmp
            if tmp*2 <= n && a[tmp] < a[tmp*2] {
                maxPos = tmp*2
            }
            if (tmp*2+1 <= n && a[maxPos] < a[tmp*2+1]) {
                maxPos = tmp*2+1
            }
            if (maxPos == tmp) {
                break
            }
            swap(&a, i: i, j: maxPos);
            tmp = maxPos;
        }
    }
    
}
