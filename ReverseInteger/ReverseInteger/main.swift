//
//  main.swift
//  ReverseInteger
//
//  Created by Mandha Smitha S on 20/02/2021.
//

import Foundation

class Solution {
    func reverse(_ x: Int) -> Int {
        var n = x
        var r = 0
        let max = Int32.max / 10
        let min = Int32.min / 10
        while n != 0 {
            let mod = n % 10
            n = n / 10
            if (r > max || (r == max && mod > 7)) {
                return 0
            }
            if (r < min || (r == min && mod < -8)) {
                return 0
            }
            r = (r * 10) + mod
        }
        return r
    }
}

print(Solution().reverse(123))
print(Solution().reverse(-123))
print(Solution().reverse(0))
print(Solution().reverse(120))
print(Solution().reverse(1534236469))
