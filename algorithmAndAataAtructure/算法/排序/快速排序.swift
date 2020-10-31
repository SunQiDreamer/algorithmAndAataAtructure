//
//  快速排序.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/10/30.
//  Copyright © 2020 孙琦. All rights reserved.
//

import Foundation

// 本质：逐渐将每一个元素都转换成轴点元素
class QuickSort: Sort {
    typealias T = Int
    var array: [Int] = []
    
    func sort() -> [Int] {
        sort(0, end: array.count)
        return array
    }
    
    // 对[begin, end)范围的元素进行快速排序
    private func sort(_ begin: Int, end: Int) {
        if end - begin < 2 {
            return
        }
        
        let mid = pivotIndex(begin, end: end)
        
        sort(begin, end: mid)
        sort(mid + 1, end: end)
    }
    
    // 构建出[begin, end)范围内的轴点元素
    private func pivotIndex(_ begin: Int, end: Int) -> Int {
        
        var newBegin = begin
        var newEnd = end
        
        // 随机选择轴点元素，降低最坏情况的出现
        let random = Int.random(in: newBegin..<newEnd)
        array.swapAt(newBegin, random)
        
        //备份begin位置的元素
        let pivot = array[newBegin]
        //end指向最后一个元素
        newEnd = newEnd - 1
        
        while newBegin < newEnd {
            while newBegin < newEnd {
                if array[newEnd] > pivot { // 右边元素 > 轴点元素
                    newEnd = newEnd - 1
                } else {
                    // 右边元素小于轴点元素，交换右边的元素到左边空余位置
                    array[newBegin] = array[newEnd]
                    newBegin = newBegin + 1
                    // 交换后改变循环方向
                    break
                }
            }
            
            while newBegin < newEnd {
                if array[newBegin] < pivot { // 左边元素 < 轴点元素
                    newBegin = newBegin + 1
                } else {
                    // 左边元素大于轴点元素，交换左边的元素到右边空余位置
                    array[newEnd] = array[newBegin]
                    newEnd = newEnd - 1
                    // 交换后改变循环方向
                    break
                }
            }
        }
        array[newBegin] = pivot
        return newBegin
    }
}
