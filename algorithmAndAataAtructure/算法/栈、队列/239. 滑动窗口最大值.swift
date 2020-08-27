//
//  239. 滑动窗口最大值.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/8/26.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/sliding-window-maximum/

import Foundation

func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
    if nums.count == 0  || k < 1 {
        return []
    }
    
    if k == 1 {
        return nums
    }
    
    var maxes: [Int] = []
    var deque = Deque<Int>(nums.count - k + 1)
    for r in 0..<nums.count {
        
        // 如果当前的值大于双端队列的队尾，删除队尾的索引值
        while !deque.isEmpty && nums[r] >= nums[deque.peekBack() ?? 0] {
            deque.dequeueBack()
        }
        
        // 将当前的索引值添加到队尾
        deque.enqueue(r)
        
        // 检查窗口的索引是否合法
        let l = r - k + 1
        if l < 0 { // 最左边的索引非法
            continue
        }
        
        if deque.peekFront() ?? 0 < l { // 队头的索引值非法（窗口已经滑出了对头索引），删除掉该索引
            deque.dequeue()
        }
        
        maxes[l] = nums[deque.peekFront() ?? 0]
    }
    
    return maxes
}
