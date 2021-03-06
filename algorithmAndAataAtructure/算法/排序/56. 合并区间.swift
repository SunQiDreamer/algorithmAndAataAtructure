//
//  56. 合并区间.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2021/4/15.
//  Copyright © 2021 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/merge-intervals/

/*
 以数组 intervals 表示若干个区间的集合，其中单个区间为 intervals[i] = [starti, endi] 。请你合并所有重叠的区间，并返回一个不重叠的区间数组，该数组需恰好覆盖输入中的所有区间。
 */

import Foundation

func merge(_ intervals: [[Int]]) -> [[Int]] {
    if intervals.count < 2 {
        return intervals
    }
    
    let sorts = intervals.sorted { (first, second) -> Bool in
        return (first[0] - second[0]) < 0
    }
    
    var last: [Int] = []
    var result: [[Int]] = []
    for interval in sorts {
        if last.count > 0, last[1] >= interval[0] {
            if result.count > 0 {
                result.removeLast()
            }
            let minFirst = min(last[0], interval[0])
            let maxSecond = max(last[1], interval[1])
            result.append([minFirst, maxSecond])
            last = [minFirst, maxSecond]
        } else {
            result.append(interval)
            last = interval
        }
        
    }
    return result
}
