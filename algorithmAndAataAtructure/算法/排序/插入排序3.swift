//
//  插入排序3.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/10/30.
//  Copyright © 2020 孙琦. All rights reserved.
//

import Foundation

// 利用二分法找逆序对，将待插入元素插入到合适位置，减少比较的次数（优化了比较次数）
class InsertionSort3: Sort {
    typealias T = Int
    var array: [Int] = []
    
    func sort() -> [Int] {
        for begin in 1..<array.count {
            // 利用二分法找到需要插入的位置
            let index = search(begin)
            // 将元素插入
            insert(begin, dest: index)
        }
        
        return array
    }
    
    /**
     * 将source位置的元素插入到dest位置
     * @param source
     * @param dest
     */
    func insert(_ source: Int, dest: Int) { // dest <= source
        let v = array[source]
        for i in dest..<source {
            // source与dest之间的元素，依次往后移一位
            array[i] = array[i - 1]
        }
        array[dest] = v
    }
    
    /**
     * 利用二分搜索找到 index 位置元素的待插入位置
     * 已经排好序数组的区间范围是 [0, index)
     * @param index
     * @return
     */
    func search(_ index: Int) -> Int {
        var begin = 0
        var end = index
        
        while begin < end {
            let mid = (begin + end) >> 1
            if array[index] < array[mid] {
                end = mid
            } else {
                begin = mid + 1
            }
        }
        return begin
    }
}
