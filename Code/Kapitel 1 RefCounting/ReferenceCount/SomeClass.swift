//
//  SomeClass.swift
//  ReferenceCount
//
//  Created by Xaver Lohmüller on 16.04.16.
//  Copyright © 2016 Xaver Lohmüller. All rights reserved.
//

import Foundation

class SomeClass {
    let value: Int = 0xAFFE;
}

extension SomeClass: CustomDebugStringConvertible {
	var debugDescription: String {
		return "Value: \(value)"
	}
}
