//
//  PointerController.swift
//  ReferenceCount
//
//  Created by Xaver Lohmüller on 17.04.16.
//  Copyright © 2016 Xaver Lohmüller. All rights reserved.
//

class PointerController<T> {
    let address: UnsafePointer<UInt32>

    private(set) var strongPointers = [T]()
    private(set) var weakPointers = [Weak<AnyObject>]()
    private(set) var unownedPointers = [Unowned<AnyObject>]()
    private(set) var unownedUnsafePointers = [UnownedUnsafe<AnyObject>]()

    init(something: T) {
        let someObject = something
        address = unsafeBitCast(someObject, UnsafePointer<UInt32>.self)
        strongPointers.append(someObject)
    }
}

// MARK: - Computed Properties
// MARK: Pointer analysis
let offset = is64() ? 2 : 1

extension PointerController {
    var strongCount: UInt {
        get {
            return UInt(address[offset] >> 2)
        }
    }
    var rcPinnedFlag: UInt {
        get {
            return UInt(address[offset] & 0x1)
        }
    }
    var rcDeallocatingFlag: UInt {
        get {
            return UInt((address[offset] & 0x2) >> 1)
        }
    }
    var weakCount: UInt {
        get {
            return UInt(address[offset + 1] >> 1)
        }
    }
    var rcUnusedFlag: UInt {
        get {
            return UInt(address[offset + 1] & 0x1)
        }
    }
    var firstValue: UInt {
        get {
            return UInt(address[offset + 2])
        }
    }
    var values: UnsafePointer<UInt64> {
        get {
            return UnsafePointer(self.address.advancedBy(4))
        }
    }
}

// MARK: Add new pointer
extension PointerController {
    var pointer: T? {
        get {
            if let strongPointer = strongPointers.first {
                return strongPointer
            } else {
                return nil
            }
        }
    }
}

// MARK: Functions

extension PointerController {
    // MARK: Strong
    func addStrongPointer() {
        if let strongPointer = pointer {
            strongPointers.append(strongPointer)
        }
    }
    func removeStrongPointer() {
        strongPointers.popLast()
        for p in unownedUnsafePointers {
            print(p.value)
        }
    }
}

extension PointerController where T: AnyObject {
    // MARK: Weak
    func addWeakPointer() {
        if let strongPointer = pointer {
            weakPointers.append(Weak(strongPointer))
        }
    }
    func removeWeakPointer() {
        weakPointers.popLast()
    }
    // MARK: Unowned
    func addUnownedPointer() {
        if let strongPointer = pointer {
            unownedPointers.append(Unowned(strongPointer))
        }
    }
    func removeUnownedPointer() {
        unownedPointers.popLast()
    }
    // MARK: Unowned(unsafe)
    func addUnownedUnsafePointer() {
        if let strongPointer = pointer {
            unownedUnsafePointers.append(UnownedUnsafe(strongPointer))
        }
    }
    func removeUnownedUnsafePointer() {
        unownedUnsafePointers.popLast()
    }
}