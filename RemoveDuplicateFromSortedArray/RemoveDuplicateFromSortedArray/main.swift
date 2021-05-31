//
//  main.swift
//  RemoveDuplicateFromSortedArray
//
//  Created by Mandha Smitha S on 25/02/2021.
//

import Foundation

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var l: Int = 0
        var r: Int = 1
        while r < nums.count {
            if nums[l] == nums[r] {
                r += 1
            } else if l < r-1 {
                l += 1
                nums[l] = nums[r]
                r += 1
            } else {
                l += 1
                r += 1
            }
        }
        for i in stride(from: nums.count-1, to: l, by: -1) {
            nums.remove(at: i)
        }
        return nums.count
    }
}

var a = [1, 1, 2]
print(Solution().removeDuplicates(&a))
var b = [1, 1, 2, 2, 2, 2, 3, 3]
print(Solution().removeDuplicates(&b))
var c = [0,0,1,1,1,2,2,3,3,4]
print(Solution().removeDuplicates(&c))
var d = [Int]()
print(Solution().removeDuplicates(&d))
var e = [1,2]
print(Solution().removeDuplicates(&e))
