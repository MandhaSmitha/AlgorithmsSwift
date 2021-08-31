//
//  main.swift
//  InsertionSort
//
//  Created by Mandha Smitha S on 9/27/20.
//  Copyright © 2020 Smitha. All rights reserved.
//

import Foundation

func insertionSort(arr: inout [Int]) -> [Int] {
    for i in 1..<arr.count-1 {
        var key = arr[i]
        var j = i-1
        while j >= 0 && arr[j] > key {
            arr[j+1] = arr[j]
            j = j-1
        }
        arr[j+1]
    }
    return arr
}

print("Enter the array to be sorted with spaces separating the numbers:")
let arr = readLine()
if var numbers = arr?.split(separator: " ").map({ Int($0)! }) {
    print("Sorted array: \(insertionSort(arr: &numbers))")
} else {
    print("Invalid input")
}

















//for i in 1..<arr.count {
//    var j = i - 1
//    let key = arr[i]
//    while j >= 0 && arr[j] > key {
//        arr[j+1] = arr[j]
//        j = j - 1
//    }
//    arr[j+1] = key
//}
//return arr
