//
//  归并排序.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/10/30.
//  Copyright © 2020 孙琦. All rights reserved.
//

import Foundation

class MergeSort: Sort {
    typealias T = Int
    var array: [Int] = []
    var leftArray: [Int]? // 用于merge时，备份左边的数组
    
    func sort() -> [Int] {
        leftArray = Array(repeating: 0, count: array.count >> 1)
        sort(0, end: array.count)
        return array
    }
    
    // 对[begin, end)范围的数据进行归并排序
    private func sort(_ begin: Int, end: Int) {
        if end - begin < 2 {
            return
        }
        let mid = (begin + end) >> 1
        sort(begin, end: mid)
        sort(mid, end: end)
        merge(begin, mid: mid, end: end)
    }
    
    // 将[begin, mid) 和 [mid, end]范围的序列合并成一个有序序列
    private func merge(_ begin: Int, mid: Int, end: Int) {
        var li = 0 // 左边的起始
        let le = mid - begin // 左边的结尾
        var ri = mid // 右边的起始
        let re = end // 右边的结尾
        var ai = begin  // 当前的索引，记录覆盖到哪个位置
        
        for i in li..<le {
            // 备份左边的数据（由于左右是一段连续的内存，不能简单的进行覆盖，会丢失数据）
            leftArray?[i] = array[begin + i]
        }
        while li < le {
            if ri < re && array[ri] < leftArray?[li] ?? 0 {
                array[ai] = array[ri]
                ai = ai + 1
                ri = ri + 1
            } else {
                array[ai] = leftArray?[li] ?? 0
                ai = ai + 1
                li = li + 1
            }
        }
    }
    
}
