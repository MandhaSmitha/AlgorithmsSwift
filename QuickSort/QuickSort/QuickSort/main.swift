//
//  main.swift
//  QuickSort
//
//  Created by Mandha Smitha S on 10/2/20.
//  Copyright © 2020 Smitha. All rights reserved.
//

import Foundation

func quickSort(arr: inout [Int]) {
    let r = arr.count - 1
    recursiveQuickSort(arr: &arr, l: 0, h: r)
}

func partition(arr: inout [Int], l: Int, h: Int) -> Int {
    let pivot = arr[h]
    var low = l - 1
    
    for j in low+1..<h {
        if arr[j] < pivot {
            low = low+1
            arr.swapAt(low, j)
        }
    }
    arr.swapAt(low+1, h)
    return low+1
}

func recursiveQuickSort(arr: inout [Int], l: Int, h: Int) {
    if h > l {
        let p = partition(arr: &arr, l: l, h: h)
        recursiveQuickSort(arr: &arr, l: l, h: p-1)
        recursiveQuickSort(arr: &arr, l: p+1, h: h)
    }
}

print("Enter the array to be sorted with spaces separating the numbers:")
let arr = readLine()
if var numbers = arr?.split(separator: " ").map({ Int($0)! }) {
    quickSort(arr: &numbers)
    print("Sorted array: \(numbers)")
} else {
    print("Invalid input")
}
