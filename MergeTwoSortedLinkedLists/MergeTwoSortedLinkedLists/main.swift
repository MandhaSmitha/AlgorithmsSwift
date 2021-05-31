//
//  main.swift
//  MergeTwoSortedLinkedLists
//
//  Created by Mandha Smitha S on 22/02/2021.
//

import Foundation

class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let head: ListNode? = ListNode()
        var current: ListNode?
        var l1 = l1
        var l2 = l2
        current = head
        
        func addNext(l: inout ListNode?) {
            current?.next = ListNode(l!.val)
            current = current?.next
            l = l?.next
        }
        
        while l1 != nil || l2 != nil {
            if l1 == nil {
                addNext(l: &l2)
            } else if l2 == nil {
                addNext(l: &l1)
            } else if let val1 = l1?.val, let val2 = l2?.val {
                if val1 <= val2 {
                    addNext(l: &l1)
                } else {
                    addNext(l: &l2)
                }
            } else if let _ = l1?.val {
                addNext(l: &l1)
            } else {
                addNext(l: &l2)
            }
        }
        return head?.next
    }
}

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

print(Solution().mergeTwoLists(ListNode(1, ListNode(2, ListNode(4))), ListNode(1, ListNode(3, ListNode(4)))))
