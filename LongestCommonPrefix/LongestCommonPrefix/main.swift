//
//  main.swift
//  LongestCommonPrefix
//
//  Created by Mandha Smitha S on 06/02/2021.
//

import Foundation

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        var prefix = strs[0]
        for value in strs {
            prefix = prefix.commonPrefix(with: value)
            if prefix == "" {
                return ""
            }
        }
        return prefix
    }
}

print(Solution().longestCommonPrefix(["flower","flow","flight"]))

class SolutionVerticalScanning {
    func longestCommonPrefix(_ strs: [String]) -> String {
        var prefix = ""
        var index = 0
        for letter in strs[0] {
            for value in strs {
                let str = Array(value)
                if value.count > index {
                    if letter != str[index] {
                        return prefix
                    }
                } else {
                    return prefix
                }
            }
            prefix.append(letter)
            index = index + 1
        }
        return prefix
    }
}

print(SolutionVerticalScanning().longestCommonPrefix(["flower","flow","flight"]))
