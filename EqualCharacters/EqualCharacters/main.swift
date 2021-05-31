//
//  main.swift
//  EqualCharacters
//
//  Created by Mandha Smitha S on 04/02/2021.
//

import Foundation

/// Problem statement:
///  Given an array of Integers and a number n, find the index where one side of the array has x number of n's and the other side has x number of non n's.
///  Example: Given 5 5 1 3 6 8 5, n = 5
///  Index 4 is the median where the left of index 4 has 2 5's and right has 2 non 5's(6, 8)
/// - Parameters:
///   - numbers: Array of Integers
///   - n: Value of reference
/// - Returns: Index satisfying the given condition or -1
func findMiddle(_ numbers: [Int], n: Int) -> Int {
    //Minimum required for a median would be 3
    if numbers.count <= 3 {
        return -1
    }
    let numbersCount = numbers.count
    var totalN = 0
    var countOfNBefore = [totalN]
    for index in 0..<numbers.count - 1 {
        totalN += (numbers[index] == n) ? 1 : 0
        countOfNBefore.append(totalN)
    }
    if totalN == 0 {
        return -1
    }
    for i in 1..<countOfNBefore.count-2 {
        let nBeforeI = countOfNBefore[i]
        let nonNBeforeI = (i + 1) - nBeforeI
        let nAfterI = totalN - countOfNBefore[i+1]
        let nonNAfterI = numbersCount - (i + 1) - nAfterI
        if nBeforeI == nonNAfterI || nonNBeforeI == nAfterI {
            return i
        }
    }
    return -1
}

print(findMiddle([5, 5, 1, 3, 6, 8, 5], n: 5))
