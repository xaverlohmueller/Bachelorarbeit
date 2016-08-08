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