//
//  239. 滑动窗口最大值.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/8/26.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/sliding-window-maximum/

import Foundation

// 使用双端队列， 将滑动窗口的索引，按照索引对应值的从大到小添加到队列中

func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
    if nums.count == 0 || k < 1 {
        return []
    }
    if k == 1 {
        return nums
    }
    
    var deque = Deque<Int>(nums.count)
    var maxes: [Int] = []
    for r in 0..<nums.count {
    
        // 当前的值大于队尾索引对用的值，将队尾索引对应的值删除
        while !deque.isEmpty && nums[r] >= nums[deque.peekBack() ?? 0] {
            deque.dequeueBack()
        }
        
        // 添加当前索引值
        deque.enqueue(r)
        
        //检查当前索引是否非法
        let l = r - k + 1
        if l < 0 { // 索引非法
            continue
        }
        
        // 检查队头合法行
        if deque.peekFront() ?? 0 < l {
            deque.dequeue()
        }
        
        // 设置最大值
        if let index = deque.peekFront() {
             maxes.append(nums[index])
        }
    }
    return maxes
}
