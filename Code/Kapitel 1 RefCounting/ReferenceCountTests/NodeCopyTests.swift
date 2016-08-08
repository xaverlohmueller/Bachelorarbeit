//
//  NodeCopyTests.swift
//  ReferenceCount
//
//  Created by Xaver Lohmüller on 01.07.16.
//  Copyright © 2016 Xaver Lohmüller. All rights reserved.
//

import XCTest
@testable import ReferenceCount

class NodeCopyTests: XCTestCase {

    func testCopy() {
        let tree1 = Node(1)

        // Shallow copy
        let tree2 = tree1
        XCTAssertEqual(tree1.element, tree2.element)
        XCTAssertTrue(tree1 === tree2)

        // Deep copy
        let tree3 = tree1.copy()
        XCTAssertEqual(tree1.element, tree3.element)
        XCTAssertFalse(tree1 === tree3)
    }

}
