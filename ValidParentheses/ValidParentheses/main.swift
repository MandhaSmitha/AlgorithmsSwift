//
//  main.swift
//  ValidParentheses
//
//  Created by Mandha Smitha S on 22/02/2021.
//

import Foundation

class Solution {
    func isValid(_ s: String) -> Bool {
        var stack: [Character] = [Character]()
        for c in s {
            switch c {
            case "[", "{", "(":
                stack.append(c)
            default:
                if let last = stack.last {
                    switch (last, c) {
                    case ("[", "]"), ("{", "}"), ("(", ")"):
                        stack.removeLast()
                    default:
                        return false
                    }
                } else {
                    return false
                }
            }
        }
        return stack.count == 0
    }
}

print(Solution().isValid("()"))
print(Solution().isValid("([]{}())"))
print(Solution().isValid("{{}}"))
print(Solution().isValid("()[]{}"))
print(Solution().isValid("("))
print(Solution().isValid(")"))
print(Solution().isValid("([]})"))
print(Solution().isValid("(]"))
print(Solution().isValid("([)]"))
