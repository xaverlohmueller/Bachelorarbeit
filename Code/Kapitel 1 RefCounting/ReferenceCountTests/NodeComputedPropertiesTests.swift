//
//  NodeComputedPropertiesTests.swift
//  ReferenceCountTests
//
//  Created by Xaver Lohmüller on 16.04.16.
//  Copyright © 2016 Xaver Lohmüller. All rights reserved.
//

import XCTest
@testable import ReferenceCount

class NodeComputedPropertiesTests: XCTestCase {

    var tree = Node(1)
    
    func testHeight() {
        tree.addNode(2)
        tree.addNode(3)
        tree.addNode(4)

        XCTAssertEqual(tree.height, 4)

        tree.addNode(5)
        XCTAssertEqual(tree.height, 5)
    }

    func testBalanced() {
        tree.addNode(6)

        XCTAssertTrue(tree.isBalanced)

        tree = Node(7)
        tree.addNode(6)
        tree.addNode(8)

        XCTAssertTrue(tree.isBalanced)

        tree = Node(1)
        tree.addNode(2)
        tree.addNode(3)

        XCTAssertFalse(tree.isBalanced)
    }

    func testBalanceFactor() {
        tree.addNode(2)

        XCTAssertEqual(tree.balanceFactor, 1)

        tree.addNode(7)

        XCTAssertEqual(tree.balanceFactor, 2)

        tree.addNode(5)

        XCTAssertEqual(tree.balanceFactor, 3)

        tree.addNode(8)

        XCTAssertEqual(tree.balanceFactor, 3)
    }
}
