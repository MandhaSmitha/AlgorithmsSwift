//
//  main.swift
//  PalindromeNumber
//
//  Created by Mandha Smitha S on 20/02/2021.
//

import Foundation

/* By converting to string. String comparisons take more time and storing the string takes constant extra space. Not optimal.*/
class Solution1 {
    func isPalindrome(_ x: Int) -> Bool {
        let s = String(x).compactMap { $0 }
        var l = 0
        var r = 0
        l = (s.count/2) - 1
        if s.count % 2 == 0 {
            r = l + 1
        } else {
            r = l + 2
        }
        while l >= 0 && r < s.count {
            if s[l] == s[r] {
                l -= 1
                r += 1
            } else {
                return false
            }
        }
        return true
    }
}

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        var n = x
        var r = 0
        if x < 0 || (x % 10 == 0 && x != 0) {
            return false
        }
        while n > r {
            r = (r * 10) + (n % 10)
            n = n / 10
        }
        return n == r || n == r / 10
    }
}

print(Solution().isPalindrome(12221))
print(Solution().isPalindrome(1))
print(Solution().isPalindrome(1221))
print(Solution().isPalindrome(121))
print(Solution().isPalindrome(10))
print(Solution().isPalindrome(12))
print(Solution().isPalindrome(123))
print(Solution().isPalindrome(-121))
print(Solution().isPalindrome(-101))
print(Solution().isPalindrome(-10))
