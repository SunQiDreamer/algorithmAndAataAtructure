//
//  插入排序2.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/10/30.
//  Copyright © 2020 孙琦. All rights reserved.
//

import Foundation

// 每次发现比待插入元素大的元素，将改元素往后挪一位，将待插入元素插入到合适的位置
class InsertionSort2: Sort {
    typealias T = Int
    var array: [Int] = []
    
    func sort() -> [Int] {
        for begin in 1..<array.count {
            var cur = begin
            // 取出当前需要插入的值
            let v = array[cur]
            while cur > 0 && v < array[cur - 1] {
                 // 当前比较的值大于需要插入的值，将当前比较的值往后挪1，减少交换次数
                array[cur] = array[cur - 1]
                cur = cur - 1
            }
            // 将需要插入的值，插入到合适的位置
            array[cur] = v
        }
        return array
    }
    
}
