//
//  main.swift
//  AddTwoNumbersLinkedList
//
//  Created by Mandha Smitha S on 16/02/2021.
//

import Foundation

//class Solution {
//    func addTwoNumbers(_ l1: ListNode<Int>?, _ l2: ListNode<Int>?) -> ListNode<Int>? {
//        let numberL1 = ListUtility.getInt(fromList: l1)
//        let numberL2 = ListUtility.getInt(fromList: l2)
//        if numberL1 ?? 0 == 0 {
//            return l2
//        }
//        if numberL2 ?? 0 == 0 {
//            return l1
//        }
//        let sum = Array(arrayLiteral: (numberL1 ?? 0) + (numberL2 ?? 0))
//        let head = ListNode(value: sum[0])
//        var current = head
//        for index in 1..<sum.count {
//            let node = ListNode(value: sum[index])
//            current.next = node
//            current = node
//        }
//        return head
//    }
//}
//
//class ListUtility {
//    static func getInt(fromList list: ListNode<Int>?) -> Int? {
//        guard var l = list else {
//            return nil
//        }
//        var number: Int? = l.value
//        while l.next != nil {
//            l = l.next!
//            number = Int("\(number!)\(l.value)")
//        }
//        return number
//    }
//}
//
//class ListNode<T> {
//    let value: T
//    var next: ListNode<T>?
//
//    init(value: T, next: ListNode<T>? = nil) {
//        self.value = value
//        self.next = next
//    }
//}
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let num1: ListNode = l1, let num2: ListNode = l2 else {
            return nil
        }
        var digitCarry = getDigitAndCarry(n1: num1.val, n2: num2.val)
        let head: ListNode = ListNode(digitCarry.0)
        var current: ListNode? = head
        var n1: ListNode? = num1.next
        var n2: ListNode? = num2.next
        var carry = digitCarry.1
        while n1 != nil || n2 != nil || carry != 0 {
            digitCarry = getDigitAndCarry(n1: (n1?.val ?? 0), n2: (n2?.val ?? 0), carry: carry)
            let node = ListNode(digitCarry.0)
            current?.next = node
            current = node
            carry = digitCarry.1
            n1 = n1?.next
            n2 = n2?.next
        }
        return head
    }

    func getDigitAndCarry(n1: Int = 0, n2: Int = 0, carry: Int = 0) -> (Int, Int) {
        let sum = n1 + n2 + carry
        let digit = sum % 10
        let carryNum = sum/10
        return(digit, carryNum)
    }
}
//class Solution {
//    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
//        guard let num1: ListNode = l1, let num2: ListNode = l2 else {
//            return nil
//        }
//        var digitCarry: (Int, Int)
//        var head: ListNode?
//        var current: ListNode?
//        var n1: ListNode? = num1
//        var n2: ListNode? = num2
//        var carry = 0
//        repeat {
//            digitCarry = getDigitAndCarry(n1: (n1?.val ?? 0), n2: (n2?.val ?? 0), carry: carry)
//            let node = ListNode(digitCarry.0)
//            if head == nil {
//                head = node
//                current = head
//            }
//            current?.val = digitCarry.0
//            current?.next = node
//            current = node
//            carry = digitCarry.1
//            n1 = n1?.next
//            n2 = n2?.next
//        } while n1 != nil || n2 != nil || carry != 0
//        return head
//    }
//
//    func getDigitAndCarry(n1: Int = 0, n2: Int = 0, carry: Int = 0) -> (Int, Int) {
//        let sum = n1 + n2 + carry
//        let digit = sum % 10
//        let carryNum = sum/10
//        return(digit, carryNum)
//    }
//}

public class ListNode {
    public var val: Int
    public var next: ListNode?
    
    public init(_ value: Int, _ next: ListNode? = nil) {
        self.val = value
        self.next = next
    }
}

//let l1 = ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9)))))))
//let l2 = ListNode(9, ListNode(9, ListNode(9)))
let l1 = ListNode(0)
let l2 = ListNode(0)
print(l2.next?.next?.val)
print(Solution().addTwoNumbers(l1, l2)?.val)
