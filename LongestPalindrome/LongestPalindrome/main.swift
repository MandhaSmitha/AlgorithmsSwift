//
//  main.swift
//  LongestPalindrome
//
//  Created by Mandha Smitha S on 19/02/2021.
//

import Foundation

class Solution {
    func longestPalindrome(_ s: String) -> String {
        var palindrome = ""
        guard s.count > 0 else {
            return ""
        }
        if s.count > 1 {
            var startIndex: Int = 0
            var endIndex: Int = 0
            let str = Array(s)
            for i in 1..<str.count {
                if str[i] == str[endIndex] {
                    endIndex -= 1
                    if endIndex == -1 || i == s.count - 1 {
                        startIndex = endIndex + 1
                        endIndex = i
                        let start = str.index(str.startIndex, offsetBy: startIndex)
                        let end = str.index(str.startIndex, offsetBy: endIndex+1)
                        let subString = String(str[start..<end])
//                        if let char = subString.first, subString == palindrome {
//                            palindrome.append(char)
//                        } else {
                            palindrome = palindrome.count < subString.count ? subString : palindrome
//                        }
                    } else {
//                        startIndex = endIndex + 1
                        let start = str.index(str.startIndex, offsetBy: endIndex+1)
                        let end = str.index(str.startIndex, offsetBy: i)
                        let subString = String(str[start..<end])
//                        if let char = subString.first, subString == palindrome {
//                            palindrome.append(char)
//                        } else {
                            palindrome = palindrome.count < subString.count ? subString : palindrome
//                        }
                    }
                } else if (i < s.count - 1 && endIndex == i - 1 && str[i+1] == str[endIndex]) {
                    continue
                } else if (i < s.count - 1 && endIndex == i - 1 && str[i+1] == str[endIndex]) {
                    continue
                } else if (endIndex == i - 1 && endIndex > 0 && str[i] == str[endIndex - 1]) {
                    endIndex -= 2
                } else if str[i] != str[endIndex] {
                    if endIndex == i - 1 {
                        endIndex += 1
                    } else {
                        startIndex = endIndex + 1
                        endIndex = i
                        let start = str.index(str.startIndex, offsetBy: startIndex)
                        let end = str.index(str.startIndex, offsetBy: endIndex)
                        let subString = String(str[start..<end])
                        palindrome = palindrome.count < subString.count ? subString : palindrome
                    }
                }
            }
        }
        return palindrome.count == 0 ? String(s.first!) : palindrome
    }
}

print(Solution().longestPalindrome("ab"))
print(Solution().longestPalindrome("abba"))
print(Solution().longestPalindrome("abbaabba"))
print(Solution().longestPalindrome("malayalamab"))
print(Solution().longestPalindrome("abmalayalamab"))
print(Solution().longestPalindrome("malayalam"))
print(Solution().longestPalindrome("321malayalam123"))
print(Solution().longestPalindrome("babad")) // bab
print(Solution().longestPalindrome("cbbd")) // bb
print(Solution().longestPalindrome("a")) // a
print(Solution().longestPalindrome("ac")) // a
print(Solution().longestPalindrome("")) // a
print(Solution().longestPalindrome("ccc")) // ccc
print(Solution().longestPalindrome("cccc")) // cccc
print(Solution().longestPalindrome("aaaaaaa")) // aaaaa
print(Solution().longestPalindrome("bananas")) // anana
