//
//  希尔排序.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/10/31.
//  Copyright © 2020 孙琦. All rights reserved.
//

import Foundation

// 按照步长一次排序，减少逆序对，最后按照步长为1排序
class ShellSort: Sort {
    typealias T = Int
    var array: [Int] = []
    
    func sort() -> [Int] {
        let stepSequence = shellStepSequence()
        for step in stepSequence {
            sort(step)
        }
        
        return array
    }
    
    // 按步长进行排序
    private func sort(_ step: Int) {
        for col in 0..<step {
            for begin in stride(from: col + step, to: array.count, by: step) {
                // 使用插入排序将步长的序列排序
                
                print("begin\(begin)")
                print("step\(step)")
                print("=========")
                
                var cur = begin
                while cur > col && array[cur] < array[cur - step] {
                    array.swapAt(cur, cur - step)
                    cur = cur - step
                }
            }
        }
    }
    
    // 步长序列， array.count >> 1 的规律
    private func shellStepSequence() -> [Int] {
        var stepSequence: [Int] = []
        var step = array.count >> 1
        while (step > 0)  {
            stepSequence.append(step)
            step = step >> 1
        }
        return stepSequence
    }
    
}
