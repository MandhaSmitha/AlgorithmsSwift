//
//  main.swift
//  LinearSearch
//
//  Created by Mandha Smitha S on 8/24/20.
//  Copyright © 2020 Smitha. All rights reserved.
//

import Foundation

func linearSearch(numbers: [Int], x: Int) -> Int {
    for i in 0..<numbers.count {
        if numbers[i] == x {
            return i
        }
    }
    return -1
}

print("Enter list of numbers separate by spaces:")
let input = readLine()
print("Enter the number to be searched")
let x = readLine()
if let arr = input?.split(separator: " ").map({ Int($0)! }), let searchInput = x {
    let index = linearSearch(numbers: Array(arr), x: Int(searchInput)!)
    index != -1 ? print("Index of number: \(index)") : print("Number not found in the array")
} else {
    print("Invalid input")
}
