//
//  冒泡排序3.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/10/29.
//  Copyright © 2020 孙琦. All rights reserved.
//

import Foundation

class BubbleSort3: Sort {
    typealias T = Int
    var array: [Int] = []
    
    func sort() -> [Int] {
        for var end in (1..<array.count).reversed() {
            var sortedIndex = 1
            for begin in 1...end {
                if array[begin - 1] < array[begin] {
                    array.swapAt(begin - 1, begin)
                    sortedIndex = begin
                }
            }
            // 每一轮记录最后一次交换的位置，下次交换到这里就可以，后面的都是有序的
            end = sortedIndex
        }
        return array
    }
}
