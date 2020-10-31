//
//  17. 电话号码的字母组合.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/9/12.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/letter-combinations-of-a-phone-number/

import Foundation

let letters = [
    ["a", "b", "c"], ["d", "e", "f"], ["g", "h", "i"],
    ["j", "k", "l"], ["m", "n", "o"], ["p", "q", "r", "s"],
    ["t", "u", "v"], ["w", "x", "y", "z"]]

var chars: [Character] = []
var string: [String] = []
var list: [String] = []

func letterCombinations(_ digits: String) -> [String] {
    
    string = Array(repeating: "", count: digits.count)
    
    chars = digits.map { $0 }
    if digits.isEmpty {
        return []
    }
    dfs(0)
    return list
}

func dfs(_ index: Int) {
    if index == chars.count {
        // 最后一层
        list.append(string.joined())
        return
    }
    
    if let c = chars[index].wholeNumberValue {
        let letter = letters[c - 2]
        for i in letter {
            string[index] = i
            dfs(index + 1)
        }
    }
}
