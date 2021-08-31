//
//  main.swift
//  RecursiveBinarySearch
//
//  Created by Mandha Smitha S on 9/16/20.
//  Copyright © 2020 Smitha. All rights reserved.
//

import Foundation

func binarySearch(numbers: [Int], x: Int) -> Int {
    return recursiveBinarySearch(numbers: numbers, l: 0, r: numbers.count - 1, x: x)
}

func recursiveBinarySearch(numbers: [Int], l: Int, r: Int, x: Int) -> Int {
    var mid: Int
    if r >= l {
        mid = (l+r)/2
        if numbers[mid] == x {
            return mid
        } else if x > numbers[mid] {
            return recursiveBinarySearch(numbers: numbers, l: mid + 1, r: r, x: x)
        } else {
            return recursiveBinarySearch(numbers: numbers, l: l, r: mid - 1, x: x)
        }
    }
    return -1
}

print("Enter an array sorted numbers in ascending order separated by spaces:")
let input = readLine()
print("Enter the number to be searched")
let x = readLine()
if let arr = input?.split(separator: " ").map({ Int($0)! }), let search = x, let searchInput = Int(search) {
    let index = binarySearch(numbers: arr, x: Int(searchInput))
    index != -1 ? print("Index of number: \(index)") : print("Number not found in the array")
} else {
    print("Invalid input")
}
