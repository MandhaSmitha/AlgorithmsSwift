//
//  LinkedList.swift
//  LinkedList
//
//  Created by Mandha Smitha S on 07/10/2020.
//  Copyright © 2020 Smitha. All rights reserved.
//

import Foundation

public struct LinkedList<Value> {
    var head: Node<Value>?
    var tail: Node<Value>?
    
    var isEmpty: Bool {
        return head == nil
    }
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        guard let head = head else {
            return "Empty list"
        }
        return String(describing: head)
    }
}

extension LinkedList {
    mutating func push(_ value: Value) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    mutating func append(_ value: Value) {
        if isEmpty {
            push(value)
            return
        }
        tail?.next = Node(value: value)
        tail = tail?.next
    }
    
    func node(at index: Int) -> Node<Value>? {
        var currentNode = head
        var currentIndex = 0
        
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode?.next
            currentIndex += 1
        }
        return currentNode
    }
    
    mutating func insert(_ value: Value, after node: Node<Value>) {
        guard tail !== node else {
            append(value)
            return
        }
        node.next = Node(value: value, next: node.next)
    }
}

extension LinkedList {
    mutating func pop() {
        head = head?.next
        if isEmpty {
            tail = nil
        }
    }
    
    mutating func removeLast() {
        guard let head = head else {
            return
        }
        guard head.next != nil else {
            pop()
            return
        }
        var previous = head
        var current = head
        
        while let next = current.next {
            previous = current
            current = next
        }
        previous.next = nil
        tail = previous
    }
    
    mutating func remove(after node: Node<Value>) {
        if node.next === tail {
            tail = node
        }
        node.next = node.next?.next
    }
}
