//
//  冒泡排序2.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/10/29.
//  Copyright © 2020 孙琦. All rights reserved.
//

import Foundation

class BubbleSort2: Sort {
    typealias T = Int
    var array: [Int] = []
    
    func sort() -> [Int] {
        for end in (1..<array.count).reversed() {
            var sorted = true
            for begin in 1...end {
                if array[begin - 1] < array[begin] {
                    array.swapAt(begin - 1, begin)
                    sorted = false
                }
            }
            
            // 如果上一次循环中，没有元素交换，说明元素已经是排好序的，直接退出循环
            if sorted {
                break
            }
        }
        return array
    }
}
