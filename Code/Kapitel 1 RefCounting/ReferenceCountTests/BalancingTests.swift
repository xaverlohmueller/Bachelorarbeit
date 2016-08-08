//
//  BalancingTests.swift
//  ReferenceCount
//
//  Created by Xaver Lohmüller on 01.07.16.
//  Copyright © 2016 Xaver Lohmüller. All rights reserved.
//

import XCTest
@testable import ReferenceCount

class BalancingTests: XCTestCase {

    var tree = Node(5)

    func testLeftRotate() {
        tree.addNode(6)
        tree.addNode(7)
        let newRoot = tree.rotateLeft()
        XCTAssertEqual(newRoot.element, 6)
        XCTAssertTrue(newRoot.isBalanced)
    }

    func testRightRotate() {
        tree.addNode(4)
        tree.addNode(3)
        let newRoot = tree.rotateRight()
        XCTAssertEqual(newRoot.element, 4)
        XCTAssertTrue(newRoot.isBalanced)
    }

    func testRightLeftRotate() {
        tree.addNode(3)
        tree.addNode(4)
        let newRoot = tree.rotateLeftRight()
        XCTAssertEqual(newRoot.element, 4)
        XCTAssertTrue(newRoot.isBalanced)
    }

    func testLeftRightRotate() {
        tree.addNode(7)
        tree.addNode(6)
        let newRoot = tree.rotateRightLeft()
        XCTAssertEqual(newRoot.element, 6)
        XCTAssertTrue(newRoot.isBalanced)
    }

    func testBalancing1() {
        tree.addNode(2)
        tree.addNode(3)
        tree.addNode(4)
        tree.addNode(8)
        XCTAssertFalse(tree.isBalanced)
        let newRoot = tree.balance()
        XCTAssertTrue(newRoot.isBalanced)
    }

    func testBalancing2() {
        tree.addNode(7)
        tree.addNode(6)
        XCTAssertFalse(tree.isBalanced)
        let newRoot = tree.balance()
        XCTAssertTrue(newRoot.isBalanced)
    }

    func testBalancing3() {
        tree.addNode(6)
        tree.addNode(7)
        XCTAssertFalse(tree.isBalanced)
        let newRoot = tree.balance()
        XCTAssertTrue(newRoot.isBalanced)
    }

    func testBalancing4() {
        tree.addNode(3)
        tree.addNode(4)
        XCTAssertFalse(tree.isBalanced)
        let newRoot = tree.balance()
        XCTAssertTrue(newRoot.isBalanced)
    }

    func testBalancing5() {
        tree.addNode(4)
        tree.addNode(3)
        XCTAssertFalse(tree.isBalanced)
        let newRoot = tree.balance()
        XCTAssertTrue(newRoot.isBalanced)
    }

}
