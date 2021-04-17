//
//  39. 组合总和.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2021/4/15.
//  Copyright © 2021 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/combination-sum/

/*
 给定一个无重复元素的数组 candidates 和一个目标数 target ，找出 candidates 中所有可以使数字和为 target 的组合。

 candidates 中的数字可以无限制重复被选取。

 说明：

 所有数字（包括 target）都是正整数。
 解集不能包含重复的组合。
 */

import Foundation

func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    var result: [[Int]] = [[]]
    for num in candidates {
        for var arr in result {
            arr.append(num)
            
            let r = arr.reduce(0) { (r, n) -> Int in
                r + n
            }
            if r == target {
                result.append(arr)
            }
        }
    }
    return result
}
