//
//  main.swift
//  BinaryTreeStruct
//
//  Created by Xaver Lohmüller on 19.06.16.
//  Copyright © 2016 Xaver Lohmüller. All rights reserved.
//

let tree1 = Tree(3)
tree1.add(1)
tree1.add(2)
tree1.add(4)
tree1.add(5)

var tree2 = tree1

print("Tree 1: \(tree1)")
print("Tree 2: \(tree2)")

print("\n" + "Mutating Tree 2..." + "\n")
tree2.root.element = 6

print("Tree 1: \(tree1)")
print("Tree 2: \(tree2)")
