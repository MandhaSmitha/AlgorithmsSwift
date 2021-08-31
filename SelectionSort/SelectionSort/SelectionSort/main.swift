//
//  main.swift
//  SelectionSort
//
//  Created by Mandha Smitha S on 9/26/20.
//  Copyright © 2020 Smitha. All rights reserved.
//

import Foundation

func selectionSort(arr: inout [Int]) -> [Int] {
    for i in 0..<arr.count-1 {
        var index = i
        for j in i+1..<arr.count {
            index = arr[index] <= arr[j] ? index : j
        }
        arr.swapAt(i, index)
    }
    return arr
}

print("Enter the array to be sorted with spaces separating the numbers:")
let arr = readLine()
if var numbers = arr?.split(separator: " ").map({ Int($0)! }) {
    print("Sorted array: \(selectionSort(arr: &numbers))")
} else {
    print("Invalid input")
}
