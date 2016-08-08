//
//  Node.swift
//  BinaryTreeStruct
//
//  Created by Xaver Lohmüller on 19.06.16.
//  Copyright © 2016 Xaver Lohmüller. All rights reserved.
//

import Foundation

final class Node<T: Comparable where T: CustomStringConvertible> {
    var element: T
    private var left: Node?
    private var right: Node?

    init(_ element: T) {
        self.element = element
    }

    deinit {
        print("deinit Node #\(element)")
    }
}

// Adding a node
extension Node {
    func addNode(newElement: T) {

        // Logik zum einfügen ...
        if newElement < element {
            if let left = left {
                left.addNode(newElement)
            } else {
                self.left = Node(newElement)
            }
        } else if newElement > element {
            if let right = right {
                right.addNode(newElement)
            } else {
                self.right = Node(newElement)
            }
        }
    }
}

// Copying
// Creates a copy of a node and all subnodes
extension Node {
    func copy() -> Node {
        let element: T
        if self.element is NSObject {
            element = ((self.element as! NSObject).copy() as! T)
        } else {
            element = self.element
        }
        let node = Node(element)
        node.left = left?.copy()
        node.right = right?.copy()
        
        return node
    }
}

extension Node: CustomStringConvertible {
    var description: String {
        get {
            // Rekursives Traversieren und Ausgeben...
            var desc = element.description

            if let left = left {
                desc = left.description + ", " + desc
            }

            if let right = right {
                desc = desc + ", " + right.description
            }

            return desc
        }
    }
}

// MARK: Height
extension Node {
    var height: Int {
        let leftHeight = left?.height ?? 0
        let rightHeight = right?.height ?? 0
        return max(leftHeight, rightHeight) + 1
    }
    var balanceFactor: Int {
        let leftHeight = left?.height ?? 0
        let rightHeight = right?.height ?? 0
        return -leftHeight + rightHeight
    }
    var isBalanced: Bool {
        return abs(balanceFactor) <= 1
    }
}

// MARK: Rotation
extension Node {
    func rotateLeft() -> Node {
        guard let newRoot = self.right
            else { fatalError("Can't have a left rotation with nil right") }
        self.right = newRoot.left
        newRoot.left = self
        return newRoot
    }
    func rotateRight() -> Node {
        guard let newRoot = self.left
            else { fatalError("Can't have a right rotation with nil left") }
        self.left = newRoot.right
        newRoot.right = self
        return newRoot
    }
    func rotateLeftRight() -> Node {
        guard let left = self.left, let newRoot = left.right
            else { fatalError() }
        left.right = newRoot.left
        newRoot.left = left
        self.left = newRoot.right
        newRoot.left = self
        return newRoot
    }
    func rotateRightLeft() -> Node {
        guard let right = self.right, let newRoot = right.left
            else { fatalError() }
        right.left = newRoot.right
        newRoot.right = right
        self.right = newRoot.left
        newRoot.left = self
        return newRoot
    }
}

// MARK: Balancing
extension Node {
    func balance() -> Node {
        // Try balancing left and right first
        self.left = self.left?.balance()
        self.right = self.right?.balance()

        switch self.balanceFactor {
        // Right heavy
        case 1 ..< Int.max:
            if self.right?.balanceFactor < 0 {
                // Right left rotation
                return self.rotateRightLeft()
            } else {
                // Simple left rotation
                return self.rotateLeft()
            }
        // Left heavy
        case Int.min ..< -1:
            if self.left?.balanceFactor > 0 {
                // Left right rotation
                return self.rotateLeftRight()
            } else {
                // Simple right rotation
                return self.rotateRight()
            }
        default:
            // already balanced
            return self
        }
    }
}

// MARK: first and last element
extension Node {
    var first: Node {
        guard var first = self.left else { return self }
        while let left = first.left {
            first = left
        }
        return first
    }

    var last: Node {
        guard var last = self.right else { return self }
        while let right = last.right {
            last = right
        }
        return last
    }
}
