//
//  选择排序.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/10/29.
//  Copyright © 2020 孙琦. All rights reserved.
//

import Foundation

//找出最大值，放在最后一位
class SelectionSort: Sort {
    typealias T = Int
    var array: [Int] = []
    
    func sort() -> [Int] {
        for end in (1..<array.count).reversed() {
            var maxIndex = 1
            for begin in 1...end {
                if array[maxIndex] < array[begin] {
                    maxIndex = begin
                }
            }
            array.swapAt(maxIndex, end)
        }
        return array
    }
}
