//
//  main.swift
//  SearchInsertPosition
//
//  Created by Mandha Smitha S on 23/02/2021.
//

import Foundation

class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var l = 0
        var r = nums.count
        repeat {
            let m = (r + l) / 2
            if nums[m] == target {
                return m
            } else if target < nums[m] {
                r = m-1
            } else {
                l = m+1
            }
        } while r > l
        return r >= 0 ? (r < nums.count && nums[r] < target ? r + 1 : r) : 0
    }
}

print(Solution().searchInsert([1,3,5,6,7], 5)) //2
print(Solution().searchInsert([1,3,5,6,7], 8)) //5
print(Solution().searchInsert([1,3,5,6,7], 0)) //0
print(Solution().searchInsert([1,3,5,6], 2)) //1
print(Solution().searchInsert([1,3,5,6], 7)) //4
print(Solution().searchInsert([1,3,5,6], 0)) //0
print(Solution().searchInsert([1], 0)) //0
print(Solution().searchInsert([1,2], 0)) //0
print(Solution().searchInsert([1,2], 3)) //2
print(Solution().searchInsert([1,2,4,5,6,8], 7)) //5
print(Solution().searchInsert([1,2,4,5,6,8], 0)) //0
print(Solution().searchInsert([1,2,4,5,6,8], 3)) //2
print(Solution().searchInsert([1,3], 2)) //1
print(Solution().searchInsert([1,3,5], 4)) //2
