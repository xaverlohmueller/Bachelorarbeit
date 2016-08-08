//
//  Classes.swift
//  LetVsVar
//
//  Created by Xaver Lohmüller on 25.07.16.
//  Copyright © 2016 Xaver Lohmüller. All rights reserved.
//

final class ClassBox<T> {
    let wrapped: T
    init(_ wrapped: T) {
        self.wrapped = wrapped
    }
}

struct ClassWrapper {
  
    class ClassWithLetStruct {
        let content = 5
    }

    class ClassWithVarStruct {
        var content = 5
    }
    class ClassWithLetClass {
        let content = ClassBox(5)
    }
    class ClassWithVarClass {
        var content = ClassBox(5)
    }


    let l1: ClassWithLetStruct
    let l2: ClassWithVarStruct
    let l3: ClassWithLetClass
    let l4: ClassWithVarClass

    var v1: ClassWithLetStruct
    var v2: ClassWithVarStruct
    var v3: ClassWithLetClass
    var v4: ClassWithVarClass

    init() {
        l1 = ClassWithLetStruct()
        l2 = ClassWithVarStruct()
        l3 = ClassWithLetClass()
        l4 = ClassWithVarClass()

        v1 = ClassWithLetStruct()
        v2 = ClassWithVarStruct()
        v3 = ClassWithLetClass()
        v4 = ClassWithVarClass()
    }
}

let classWrapper = ClassWrapper()
