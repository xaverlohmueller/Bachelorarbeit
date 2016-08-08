//
//  main.swift
//  ClosureCapture
//
//  Created by Xaver Lohmüller on 06.08.16.
//  Copyright © 2016 Xaver Lohmüller. All rights reserved.
//

import Foundation

print("Hello, World!")


func test1() {
  var box = HeapBox(content: 5)
  print("before closure: \(box.content)")
  delay(1) {
    print("inside closure: \(box.content)")
  }
  box = HeapBox(content: 10)
  print("after closure: \(box.content)")
}

func test2() {
  var box = StackBox(content: 5)
  print("before closure: \(box.content)")
  delay(1) {
    print("inside closure: \(box.content)")
  }
  box = StackBox(content: 10)
  print("after closure: \(box.content)")
}

func test3() {
  var box = HeapBox(content: 5)
  print("before closure: \(box.content)")
  delay(1) { [box] in
    // ...
    print("inside closure: \(box.content)")
  }
  box = HeapBox(content: 10)
  print("after closure: \(box.content)")
}

func test4() {
  var box = StackBox(content: 5)
  print("before closure: \(box.content)")
  delay(1) { [box] in
    print("inside closure: \(box.content)")
  }
  box = StackBox(content: 10)
  print("after closure: \(box.content)")
}

func test5() {
  var box = HeapBox(content: 5)
  print("before closure: \(box.content)")
  delay(1) { [box] in
    print("inside closure: \(box.content)")
  }
  box.content = 10
  print("after closure: \(box.content)")
}

func test6() {
  var box = StackBox(content: 5)
  print("before closure: \(box.content)")
  delay(1) { [box] in
    print("inside closure: \(box.content)")
  }
  box.content = 10
  print("after closure: \(box.content)")
}

//test1()
//test2()
//test3()
//test4()
//test5()
//test6()