//
//  main.swift
//  BubbleSort
//
//  Created by Mandha Smitha S on 9/27/20.
//  Copyright © 2020 Smitha. All rights reserved.
//

import Foundation

func bubbleSort(arr: inout [Int]) -> [Int] {
    for i in 0..<arr.count-1 {
        for j in 0..<arr.count-i-1 {
            if arr[j] > arr[j+1] {
                arr.swapAt(j, j+1)
            }
        }
    }
    return arr
}

print("Enter the array to be sorted with spaces separating the numbers:")
let arr = readLine()
if var numbers = arr?.split(separator: " ").map({ Int($0)! }) {
    print("Sorted array: \(bubbleSort(arr: &numbers))")
} else {
    print("Invalid input")
}
