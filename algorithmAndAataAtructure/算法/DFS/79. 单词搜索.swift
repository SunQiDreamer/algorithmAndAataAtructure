//
//  79. 单词搜索.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2021/4/14.
//  Copyright © 2021 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/word-search/

/*
 给定一个 m x n 二维字符网格 board 和一个字符串单词 word 。如果 word 存在于网格中，返回 true ；否则，返回 false 。
 
 单词必须按照字母顺序，通过相邻的单元格内的字母构成，其中“相邻”单元格是那些水平相邻或垂直相邻的单元格。同一个单元格内的字母不允许被重复使用。
 */

import Foundation

var res = false
var boards: [[Character]] = []
var words: [Character] = []
var userd: [[Int]] = []

func exist(_ board: [[Character]], _ word: String) -> Bool {
    guard board.count > 0, word.count > 0 else {
        return false
    }
    boards = board
    words = Array(word)
    userd = Array(repeating: Array(repeating: 0, count: board[0].count), count: board.count)
    
    for i in 0..<board.count {
        for j in 0..<board[0].count {
            if backtrack(i, j, 0) {
                res = true
            }
        }
    }
    return res
}

func backtrack(_ i: Int, _ j: Int, _ index: Int) -> Bool {
    if i < 0 || j < 0 || i >= boards.count || j >= boards[0].count {
        return false
    }
    
    if index >= words.count {
        return true
    }
    
    if (boards[i][j] != words[index]) || userd[i][j] == 1 {
        return false
    }
    
    userd[i][j] = 1
    if backtrack(i + 1, j, index + 1) ||
        backtrack(i - 1, j, index + 1) ||
        backtrack(i, j + 1, index + 1) ||
        backtrack(i, j - 1, index + 1) {
        return true
    }
    // 回溯
    userd[i][j] = 0
    return false
}
