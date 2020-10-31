//
//  插入排序.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/10/30.
//  Copyright © 2020 孙琦. All rights reserved.
//

import Foundation

class InsertionSort: Sort {
    typealias T = Int
    var array: [Int] = []
    
    func sort() -> [Int] {
        
        for begin in 1..<array.count {
            var cur = begin
            
            while cur > 0 && array[cur] < array[cur - 1] {
                array.swapAt(cur, cur - 1)
                cur = cur - 1
            }
        }
        return array
    }
}
