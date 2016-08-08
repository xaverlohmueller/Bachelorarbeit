//
//  FirstLastTests.swift
//  ReferenceCount
//
//  Created by Xaver Lohmüller on 01.07.16.
//  Copyright © 2016 Xaver Lohmüller. All rights reserved.
//

import XCTest
@testable import ReferenceCount

class FirstLastTests: XCTestCase {

    var tree = Node(5)

    override func setUp() {
        super.setUp()
        for i in 1...11 {
            tree.addNode(i)
        }
    }

    func testFirst() {
        let first = tree.first
        XCTAssertEqual(first.element, 1)
        let newRoot = tree.balance()
        XCTAssertEqual(newRoot.first.element, 1)
    }

    func testLast() {
        let last = tree.last
        XCTAssertEqual(last.element, 11)
        let newRoot = tree.balance()
        XCTAssertEqual(newRoot.last.element, 11)
    }

    func testSelfFirst() {
        tree = Node(1)
        let first = tree.first
        XCTAssertEqual(first.element, 1)
    }

    func testSelfLast() {
        tree = Node(1)
        let last = tree.last
        XCTAssertEqual(last.element, 1)
    }
}
