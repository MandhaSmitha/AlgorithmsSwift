//
//  main.swift
//  Stack
//
//  Created by Mandha Smitha S on 05/10/2020.
//  Copyright © 2020 Smitha. All rights reserved.
//

import Foundation

enum braceType: Character {
    case round = ")"
    case square = "]"
    case curly = "}"
    
    func match() -> Character {
        switch self {
        case .round:
            return "("
        case .square:
            return "["
        case .curly:
            return "{"
        }
    }
}

print("Enter the string pattern")
let pattern = readLine()
var stack = Stack<Character>()

if let patternStr = pattern {
    for char in patternStr {
        if let type = braceType(rawValue: char) {
            if type.match() == stack.peek() {
                stack.pop()
            } else {
                print("Invalid pattern")
                break
            }
        } else {
            stack.push(char)
        }
    }
    if stack.isEmpty {
        print("Valid pattern")
    } else {
        print("Invalid pattern")
    }
}

