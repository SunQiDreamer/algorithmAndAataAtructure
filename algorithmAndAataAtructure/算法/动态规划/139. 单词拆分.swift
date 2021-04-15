//
//  139. 单词拆分.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2021/4/14.
//  Copyright © 2021 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/word-break/

/*
 给定一个非空字符串 s 和一个包含非空单词的列表 wordDict，判定 s 是否可以被空格拆分为一个或多个在字典中出现的单词。

 说明：

 拆分时可以重复使用字典中的单词。
 你可以假设字典中没有重复的单词。
 
 输入: s = "leetcode", wordDict = ["leet", "code"]
 输出: true
 解释: 返回 true 因为 "leetcode" 可以被拆分成 "leet code"。
 示例 2：

 输入: s = "applepenapple", wordDict = ["apple", "pen"]
 输出: true
 解释: 返回 true 因为 "applepenapple" 可以被拆分成 "apple pen apple"。
      注意你可以重复使用字典中的单词。
 示例 3：

 输入: s = "catsandog", wordDict = ["cats", "dog", "sand", "and", "cat"]
 输出: false
 */

import Foundation

// dp数组的含义： j~i之间形成的subString包含在wordDict之内，并且dp[j] == true, 则dp[i] = true;

func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
    let set = Set(wordDict)
    var dp: [Bool] = Array(repeating: false, count: s.count + 1)
    dp[0] = true
    for i in 0...s.count {
        for j in 0..<i {
            let subString = s[s.index(s.startIndex, offsetBy: j)..<s.index(s.startIndex, offsetBy: i)]
            let string = String(subString)
            if dp[j] && set.contains(string) {
                dp[i] = true
                break
            }
        }
    }
    return dp[s.count]
}
