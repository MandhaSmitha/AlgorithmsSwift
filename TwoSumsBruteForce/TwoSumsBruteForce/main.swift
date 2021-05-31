//
//  main.swift
//  TwoSumsBruteForce
//
//  Created by Mandha Smitha S on 05/02/2021.
//

import Foundation

/* Brute force */
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var indices = [Int]()
        for i in 0..<nums.count-1 {
            for j in i+1..<nums.count {
                if nums[i] + nums[j] == target {
                    indices = [i, j]
                    return indices
                }
            }
        }
        return indices
    }
}

print(Solution().twoSum([3,2,4], 6))

/* Two pass hash table */
class Solution1 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var map = [Int: Int]()
        for i in 0..<nums.count {
            map[nums[i]] = i
        }
        for i in 0..<nums.count {
            let value = nums[i]
            let difference = target - value
            if let index = map[difference], i != index {
                return [i, index]
            }
        }
        return []
    }
}

print(Solution1().twoSum([3,2,4], 6))

/* One pass hash table */
class Solution2 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var map = [Int: Int]()
        for i in 0..<nums.count {
            let value = nums[i]
            let difference = target - value
            if let index = map[difference], i != index {
                return [i, index]
            }
            map[nums[i]] = i
        }
        return []
    }
}

print(Solution2().twoSum([3,2,4], 6))
