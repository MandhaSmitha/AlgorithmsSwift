//
//  main.swift
//  LinkedList
//
//  Created by Mandha Smitha S on 07/10/2020.
//  Copyright © 2020 Smitha. All rights reserved.
//

import Foundation

var list = LinkedList<Int>()
list.append(4)
list.push(2)
list.append(3)
list.push(1)

if let midNode = list.node(at: 2) {
    list.insert(5, after: midNode)
}
print(list)
