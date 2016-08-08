//
//  Structs.swift
//  LetVsVar
//
//  Created by Xaver Lohmüller on 25.07.16.
//  Copyright © 2016 Xaver Lohmüller. All rights reserved.
//

final class StructBox<T> {
    let wrapped: T
    init(_ wrapped: T) {
        self.wrapped = wrapped
    }
}

struct StructWrapper {

    struct StructWithLetStruct {
        let content = 5
    }
    struct StructWithVarStruct {
        var content = 5
    }
    struct StructWithLetClass {
        let content = StructBox(5)
    }
    struct StructWithVarClass {
        var content = StructBox(5)
    }


    let l1: StructWithLetStruct
    let l2: StructWithVarStruct
    let l3: StructWithLetClass
    let l4: StructWithVarClass

    var v1: StructWithLetStruct
    var v2: StructWithVarStruct
    var v3: StructWithLetClass
    var v4: StructWithVarClass

    init() {
        l1 = StructWithLetStruct()
        l2 = StructWithVarStruct()
        l3 = StructWithLetClass()
        l4 = StructWithVarClass()

        v1 = StructWithLetStruct()
        v2 = StructWithVarStruct()
        v3 = StructWithLetClass()
        v4 = StructWithVarClass()
    }
}

let structWrapper = StructWrapper()
