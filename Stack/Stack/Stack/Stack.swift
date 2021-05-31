//
//  Stack.swift
//  Stack
//
//  Created by Mandha Smitha S on 05/10/2020.
//  Copyright © 2020 Smitha. All rights reserved.
//

import Foundation

public struct Stack<Element> {
    var elements: [Element] = []
    
    public init() { }
    
    public init(_ elements: [Element]) {
        self.elements = elements
    }
}

extension Stack {
    public mutating func push(_ element: Element) {
        self.elements.append(element)
    }
    
    @discardableResult
    public mutating func pop() -> Element? {
        return self.elements.popLast()
    }
}

extension Stack {
    public func peek() -> Element? {
        return elements.last
    }
    
    public var isEmpty: Bool {
        return peek() == nil
    }
}
