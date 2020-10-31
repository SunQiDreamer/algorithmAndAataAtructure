//
//  Sort.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/10/29.
//  Copyright © 2020 孙琦. All rights reserved.
//

import Foundation

protocol Sort {
    associatedtype T
    func sort() -> [T]
    var array: [T] { get set}
}
