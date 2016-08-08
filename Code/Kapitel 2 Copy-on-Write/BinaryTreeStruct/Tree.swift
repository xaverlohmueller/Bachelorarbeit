//
//  Tree.swift
//  BinaryTreeStruct
//
//  Created by Xaver Lohmüller on 19.06.16.
//  Copyright © 2016 Xaver Lohmüller. All rights reserved.
//

import Foundation

struct Tree<T: Comparable where T: CustomStringConvertible> {
    private var _root: Node<T>

    var root: Node<T> {
        // Öffentlicher Zugriff auf die Wurzel
        mutating get {
            if !isUniquelyReferencedNonObjC(&_root) {
                _root = _root.copy()
            }
            return _root
        }
        set {
            _root = newValue
        }
    }

    func add(element: T) {
        _root.addNode(element)
    }

    init(_ element: T) {
        _root = Node(element)
    }
}

extension Tree: CustomStringConvertible {
    var description: String {
        get {
            return _root.description
        }
    }
}
