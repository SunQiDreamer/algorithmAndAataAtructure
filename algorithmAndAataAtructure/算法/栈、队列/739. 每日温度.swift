//
//  739. 每日温度.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/8/27.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/daily-temperatures/

import Foundation


// 就是求右边第一个比他大的值的索引，使用栈
func dailyTemperatures(_ T: [Int]) -> [Int] {
    
    if T.count == 0 {
        return []
    }
    
    var results: [Int] = []
    for _ in 0..<T.count {
        results.append(0)
    }
    let stack = Stack<Int>()
    
    for index in 0..<T.count {
        while !stack.isEmpty() && T[index] > T[stack.top() ?? 0] {
            if let i = stack.top() {
                // index为右边第一个温度他i高的索引，index - i 为需要几天温度比当前温度高
                results[i] = index - i
            }
            stack.pop()
        }
        stack.push(index)
    }
    return results
}

// 倒推法
func dailyTemperatures1(_ T: [Int]) -> [Int] {
    
    if T.count == 0 {
        return []
    }
    
    var results: [Int] = []
    for _ in 0..<T.count {
        results.append(0)
    }
    
    for i in (0..<T.count - 1).reversed() {
        
        var j = i + 1
        
        while true {
            let vi = T[i]
            let vj = T[j]
            
            if vi < vj { // i的温度小于j的温度
                results[i] = j - i
                break
            } else if vi == vj { // i的温度小于j的温度
                
                if results[j] == 0 { // j之后没有比j温度高的
                    results[i] = 0  // 说明i之后也没有比i温度高的
                } else {
                    results[i] = j - i + results[j]  // 比i温度高的为比j温度高的+j到i的天数
                }
                
                break
            } else { // i的温度大于j
                if results[j] == 0 { // j之后没有比j温度高的
                    results[i] = 0  // 说明i之后也没有比i温度高的
                    break
                } else { // j之后有比j温度高的，跳到温度高的那天
                    j = j + results[j]
                }
            }
        }
    }
    
    return results
}

// 倒推法
func dailyTemperatures2(_ T: [Int]) -> [Int] {
    
    if T.count == 0 {
        return []
    }
    
    var results: [Int] = []
    for _ in 0..<T.count {
        results.append(0)
    }
    
    for i in (0..<T.count - 1).reversed() {
        var j = i + 1
        while true {
            let vi = T[i]
            let vj = T[j]
            
            if vi < vj { // i的温度小于j的温度
                results[i] = j - i
                break
            } else if results[j] == 0 {
                results[i] = 0
                break
            } else {                
                j = j + results[j]
            }
        }
    }
    
    return results
}

