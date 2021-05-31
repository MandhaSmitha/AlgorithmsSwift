//
//  main.swift
//  LongestSubstringWithoutRepeatingChars
//
//  Created by Mandha Smitha S on 17/02/2021.
//

import Foundation

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var map: [Character: Int] = [Character: Int]()
        var count = 0
        var startIndex = 0
        var currentIndex = 0
        
        func updateCount() {
            let currentCount = currentIndex - startIndex
            count = currentCount > count ? currentCount : count
        }
        
        for c in s {
            if let indexOfChar = map[c], indexOfChar >= startIndex {
                updateCount()
                startIndex = indexOfChar + 1
            }
            map[c] = currentIndex
            currentIndex += 1
        }
        updateCount()
        return count
    }
}

print(Solution().lengthOfLongestSubstring("abba"))
