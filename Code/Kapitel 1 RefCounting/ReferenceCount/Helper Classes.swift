//
//  Helper Classes.swift
//  ReferenceCount
//
//  Created by Xaver Lohmüller on 17.04.16.
//  Copyright © 2016 Xaver Lohmüller. All rights reserved.
//

import Foundation

// Since references inside Array are always strong:
// http://stackoverflow.com/questions/24127587/how-do-i-declare-an-array-of-weak-references-in-swift

struct Weak<T: AnyObject> {
	weak var value : T?
	init(_ value: T) {
		self.value = value
	}
}

struct Unowned<T: AnyObject> {
	unowned var value : T
	init(_ value: T) {
		self.value = value
	}
}

struct UnownedUnsafe<T: AnyObject> {
	unowned(unsafe) var value : T
	init(_ value: T) {
		self.value = value
	}
}

func is64() -> Bool {
    return sizeof(UInt) == 8
}