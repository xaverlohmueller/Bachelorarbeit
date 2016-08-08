//
//  InsertTests.swift
//  ReferenceCount
//
//  Created by Xaver Lohmüller on 01.07.16.
//  Copyright © 2016 Xaver Lohmüller. All rights reserved.
//

import XCTest
@testable import ReferenceCount

class InsertTests: XCTestCase {

    var tree = Node(5)

    func testInsertInOrder() {
        tree.addNode(6)
        XCTAssertEqual(tree.description, "5, 6")
        tree.addNode(7)
        XCTAssertEqual(tree.description, "5, 6, 7")
        tree.addNode(4)
        XCTAssertEqual(tree.description, "4, 5, 6, 7")
        tree.addNode(3)
        XCTAssertEqual(tree.description, "3, 4, 5, 6, 7")
    }

    func testInsertReverseOrder() {
        tree.addNode(7)
        XCTAssertEqual(tree.description, "5, 7")
        tree.addNode(6)
        XCTAssertEqual(tree.description, "5, 6, 7")
        tree.addNode(3)
        XCTAssertEqual(tree.description, "3, 5, 6, 7")
        tree.addNode(4)
        XCTAssertEqual(tree.description, "3, 4, 5, 6, 7")
    }
}
