//
//  main.swift
//  MedianOfSortedArrays
//
//  Created by Mandha Smitha S on 17/02/2021.
//

import Foundation

class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        if nums1.count == 0 && nums2.count == 0 {
            return 0.0
        }
        var currentCount = 0
        var medianIndex = 0
        var median = 0.0
        var isEven = false
        let count = (nums1.count + nums2.count)
        if count % 2 == 0 {
            medianIndex = (count / 2) - 1
            isEven = true
        } else {
            medianIndex = Int(floor(Double(count / 2)))
        }
        var n1L = 0
        var n1R = nums1.count - 1
        var n2L = 0
        var n2R = nums2.count - 1
        
        if nums1.count == 0 {
            let index = nums2.count/2
            let median = isEven ? (Double(nums2[index] + nums2[index-1])/2.0) : Double(nums2[Int(floor(Double(index)))])
            return median
        } else if nums2.count == 0 {
            let index = nums1.count/2
            let median = isEven ? (Double(nums1[index] + nums1[index-1])/2.0) : Double(nums1[Int(floor(Double(index)))])
            return median
        } else if nums1.count == 1 && nums2.count == 1 {
            return (Double(nums1[0] + nums2[0])/2.0)
        }
        
        repeat {
            let m1 = Int(floor(Double((n1L + n1R) / 2)))
            let m2 = Int(floor(Double((n2L + n2R) / 2)))
            if nums1[m1] == nums2[m2] {
                if m1+m2 == medianIndex {
                    n1L = m1
                    n2L = m2
                } else if m1 < nums1.count - 1 {
                    n1L = m1 + 1
                    n2L = m2
                } else if m2 < nums2.count - 1 {
                    n1L = m1
                    n2L = m2 + 1
                }
            } else if nums1[m1] > nums2[m2] {
                n2L = m2 + 1
                n1R = m1 - 1
            } else {
                n1L = m1 + 1
                n2R = m2 - 1
            }
            currentCount = n1L + n2L
        } while (currentCount != medianIndex)
        
        if n1L >= nums1.count {
            median = isEven ? Double(nums2[medianIndex - n1L] + nums2[(medianIndex - n1L)+1])/2.0 : Double(nums2[medianIndex - n1L])
        } else if n2L >= nums2.count {
            median = isEven ? Double(nums1[medianIndex - n2L] + nums1[(medianIndex - n2L)+1])/2.0 : Double(nums1[medianIndex - n2L])
        } else {
            if isEven {
                let s1 = n1L < nums1.count - 1 ? nums1[n1L] + nums1[n1L+1] : Int.max
                let s2 = n2L < nums2.count - 1 ? nums2[n2L] + nums2[n2L+1] : Int.max
                let s3 = nums1[n1L] + nums2[n2L]
                let sum = min(s1, s2, s3)
                median = Double(Double(sum) / 2.0)
            } else {
                if n1L + n2L == medianIndex {
                    median = Double(min(nums1[n1L], nums2[n2L]))
                } else {
                    median = Double(max(nums1[n1L], nums2[n2L]))
                }
            }
        }
        return median
    }
}

//print(Solution().findMedianSortedArrays([1,2], [1])) //1.0
//print(Solution().findMedianSortedArrays([1], [1,2])) //1.0
//print(Solution().findMedianSortedArrays([100000], [100001])) //100000.5
//print(Solution().findMedianSortedArrays([0,0], [0,0])) //0.0
//print(Solution().findMedianSortedArrays([], [])) //0.0
//print(Solution().findMedianSortedArrays([1,2], [3,4])) //2.5
//print(Solution().findMedianSortedArrays([1,3,5,7,9,11], [2,4,6,8,10,12])) //6.5
//print(Solution().findMedianSortedArrays([1,3], [2])) //2.0
//print(Solution().findMedianSortedArrays([1], [2])) //1.5
//print(Solution().findMedianSortedArrays([1,2], [1,2,3])) //2.0
//print(Solution().findMedianSortedArrays([1,2], [-1,3])) //1.5
print(Solution().findMedianSortedArrays([2], [1,3,4])) //2.5
//print(Solution().findMedianSortedArrays([1], [2,3])) //2.0
//print(Solution().findMedianSortedArrays([1], [2,3,4])) //2.5
//print(Solution().findMedianSortedArrays([1,2,3,4,5], [1,2,3,4,5])) //3.0

//class Solution {
//    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
//        if nums1.count == 0 && nums2.count == 0 {
//            return 0.0
//        } else if nums1.count == 0 {
//            let index = nums2.count/2
//            let median = nums2.count % 2 == 0 ? (Double(nums2[index] + nums2[index-1])/2.0) : Double(nums2[Int(floor(Double(index)))])
//            return median
//        } else if nums2.count == 0 {
//            let index = nums1.count/2
//            let median = nums1.count % 2 == 0 ? (Double(nums1[index] + nums1[index-1])/2.0) : Double(nums1[Int(floor(Double(index)))])
//            return median
//        } else if nums1.count == 1 && nums2.count == 1 {
//            return (Double(nums1[0] + nums2[0])/2.0)
//        }
//        var currentCount = 0
//        var medianIndex = 0
//        var median = 0.0
//        var isEven = false
//        let count = (nums1.count + nums2.count)
//        if count % 2 == 0 {
//            medianIndex = (count / 2) - 1
//            isEven = true
//        } else {
//            medianIndex = Int(floor(Double(count / 2)))
//        }
//
//        var n1L = 0
//        var n1R = nums1.count - 1
//        var n2L = 0
//        var n2R = nums2.count - 1
//
//        repeat {
//            let m1 = Int(floor(Double((n1L + n1R) / 2)))
//            let m2 = Int(floor(Double((n2L + n2R) / 2)))
//            if nums1[m1] == nums2[m2] {
//                if m1+m2 == medianIndex {
//                    n1L = m1
//                    n2L = m2
//                } else if m1 < nums1.count - 1 {
//                    n1L = m1 + 1
//                    n2L = m2
//                } else if m2 < nums2.count - 1 {
//                    n1L = m1
//                    n2L = m2 + 1
//                }
//            } else if nums1[m1] > nums2[m2] {
//                n1R = m1 - 1
//                n2L = m2 + 1
//            } else {
//                n1L = m1 + 1
//                n2R = m2 - 1
//            }
//            currentCount = n1L + n2L
//        } while currentCount != medianIndex
//        if isEven {
//            let s1 = n1L < nums1.count - 1 ? nums1[n1L] + nums1[n1L+1] : Int.max
//            let s2 = n2L < nums2.count - 1 ? nums2[n2L] + nums2[n2L+1] : Int.max
//            let s3 = nums1[n1L] + nums2[n2L]
//            let sum = min(s1, s2, s3)
//            median = Double(Double(sum) / 2.0)
//        } else {
//            median = Double(min(nums1[n1L], nums2[n2L]))
//        }
//        return median
//    }
//}
//
//print(Solution().findMedianSortedArrays([1], [2,3]))

//class Solution {
//    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
//        if nums1.count == 0 && nums2.count == 0 {
//            return 0.0
//        }
//        var currentCount = 0
//        var medianIndex = 0
//        var median = 0.0
//        var isEven = false
//        let count = (nums1.count + nums2.count)
//        if count % 2 == 0 {
//            medianIndex = (count / 2) - 1
//            isEven = true
//        } else {
//            medianIndex = Int(floor(Double(count / 2)))
//        }
//
//        if nums1.count == 0 {
//            let index = nums2.count/2
//            let median = nums2.count % 2 == 0 ? (Double(nums2[index] + nums2[index-1])/2.0) : Double(nums2[Int(floor(Double(index)))])
//            return median
//        } else if nums2.count == 0 {
//            let index = nums1.count/2
//            let median = nums1.count % 2 == 0 ? (Double(nums1[index] + nums1[index-1])/2.0) : Double(nums1[Int(floor(Double(index)))])
//            return median
//        } else if nums1.count == 1 && nums2.count == 1 {
//            return (Double(nums1[0] + nums2[0])/2.0)
//        }
//
//        var n1L = 0
//        var n1R = nums1.count - 1
//        var n2L = 0
//        var n2R = nums2.count - 1
//
//        repeat {
//            if nums1[n1R] < nums2[n2L] {
//                n1L = n1R
//                currentCount = n1R + n2L
//            } else if nums2[n2R] < nums1[n1L] {
//                n2L = n2R
//                currentCount = n2R + n1L
//            } else  {
//                let m1 = Int(floor(Double((n1L + n1R) / 2)))
//                let m2 = Int(floor(Double((n2L + n2R) / 2)))
//
//                if nums1[m1] == nums2[m2] {
//                    if m1+m2 == medianIndex {
//                        n1L = m1
//                        n2L = m2
//                    } else if m1 < nums1.count - 1 {
//                        n1L = m1 + 1
//                        n2L = m2
//                    } else if m2 < nums2.count - 1 {
//                        n1L = m1
//                        n2L = m2 + 1
//                    }
//                } else if nums1[m1] > nums2[m2] {
//                    n1R = max(0, m1 - 1)
//                    n2L = min(nums2.count - 1, m2 + 1)
//                } else {
//                    n1L = min(nums1.count - 1, m1 + 1)
//                    n2R = max(0, m2 - 1)
//                }
//                currentCount = n1L + n2L
//            }
//        } while currentCount != medianIndex
//        if isEven {
//            let s1 = n1L < nums1.count - 1 ? nums1[n1L] + nums1[n1L+1] : Int.max
//            let s2 = n2L < nums2.count - 1 ? nums2[n2L] + nums2[n2L+1] : Int.max
//            let s3 = nums1[n1L] + nums2[n2L]
//            let sum = min(s1, s2, s3)
//            median = Double(Double(sum) / 2.0)
//        } else {
//            if n1L + n2L == medianIndex {
//                median = Double(min(nums1[n1L], nums2[n2L]))
//            } else if nums1[n1R] < nums2[n2L] {
//                median = Double(nums2[medianIndex - (n1R + 1)])
//            } else if nums2[n2R] < nums1[n1L] {
//                median = Double(nums1[medianIndex - (n2R + 1)])
//            }
//        }
//        return median
//    }
//}
//
//print(Solution().findMedianSortedArrays([1,2], [1,2,3]))
