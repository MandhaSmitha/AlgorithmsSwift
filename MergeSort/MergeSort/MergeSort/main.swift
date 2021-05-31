//
//  main.swift
//  MergeSort
//
//  Created by Mandha Smitha S on 9/30/20.
//  Copyright © 2020 Smitha. All rights reserved.
//

import Foundation

func mergeSort(arr: inout [Int]) {
    let r = arr.count - 1
    recursiveMergeSort(arr: &arr, l: 0, r: r)
}

func merge(arr: inout [Int], l: Int, m: Int, r: Int) {
    let leftArray = Array(arr[l...m])
    let rightArray = Array(arr[m+1...r])
    
    var i = 0
    var j = 0
    var k = l
    
    while i < leftArray.count && j < rightArray.count {
        if leftArray[i] <= rightArray[j] {
            arr[k] = leftArray[i]
            i = i+1
        } else {
            arr[k] = rightArray[j]
            j = j+1
        }
        k = k+1
    }
    
    while i < leftArray.count {
        arr[k] = leftArray[i]
        i = i+1
        k = k+1
    }
    
    while j < rightArray.count {
        arr[k] = rightArray[j]
        j = j+1
        k = k+1
    }
}

func recursiveMergeSort(arr: inout [Int], l: Int, r: Int){
    if r > l {
        let mid = (l+r)/2
        print("mid : \(mid)")
        print("l to mid recursive : \(l) \(mid)")
        recursiveMergeSort(arr: &arr, l: l, r: mid)
        print("mid+1 to r : \(mid+1) \(r)")
        recursiveMergeSort(arr: &arr, l: mid+1, r: r)
        print("Calling merge")
        merge(arr: &arr, l: l, m: mid, r: r)
        print("Merged array : \(arr)")
    }
 }

print("Enter the array to be sorted with spaces separating the numbers:")
let arr = readLine()
if var numbers = arr?.split(separator: " ").map({ Int($0)! }) {
    mergeSort(arr: &numbers)
    print("Sorted array: \(numbers)")
} else {
    print("Invalid input")
}
