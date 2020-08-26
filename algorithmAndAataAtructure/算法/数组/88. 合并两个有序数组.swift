//
//  88. 合并两个有序数组.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/8/25.
//  Copyright © 2020 孙琦. All rights reserved.
//
// https://leetcode-cn.com/problems/merge-sorted-array/
import Foundation

func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    
    // 三指针，其中两个指针指向真实数据的尾部，一个指针指向nums1的队尾
    // 判断两个指针的值，将较大的的值，放在第三个指针的位置上，以此类推
    
    var i1 = m - 1
    var i2 = n - 1
    var cur = nums1.count - 1
    
    while i2 >= 0 {
        
        var num1 = Int.min
        let num2 = nums2[i2]
        
        if i1 >= 0 {
            num1 = nums1[i1]
        }
        
        if num2 <= num1 {
            nums1[cur] = num1
            cur -= 1
            i1 -= 1
            
        } else {
            nums1[cur] = num2
            cur -= 1
            i2 -= 1
        }
    }
}
