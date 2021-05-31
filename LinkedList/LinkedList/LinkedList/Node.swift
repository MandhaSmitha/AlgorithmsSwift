//
//  Node.swift
//  LinkedList
//
//  Created by Mandha Smitha S on 07/10/2020.
//  Copyright © 2020 Smitha. All rights reserved.
//

import Foundation

public class Node<Value> {
    var value: Value
    var next: Node?
    
    init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    public var description: String {
        guard let next = next else {
            return "\(value)"
        }
        
        return "\(value) -> " + String(describing: next)
    }
}
