//
//  冒泡排序1.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/10/29.
//  Copyright © 2020 孙琦. All rights reserved.
//

import Foundation

class BubbleSort1: Sort {
    typealias T = Int
    var array: [Int] = []
    
    func sort() -> [Int] {
        for end in (1..<array.count).reversed() {
            for begin in 1...end {
                if array[begin - 1] < array[begin] {
                    array.swapAt(begin - 1, begin)
                }
            }
        }
        return array
    }
    
}
