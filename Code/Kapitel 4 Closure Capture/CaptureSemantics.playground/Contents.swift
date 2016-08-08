import XCPlayground
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

func demo1() {
    let pokemon = Pokemon(name: "Mewtwo")
    print("before closure: \(pokemon)")
    delay(1) {
        print("inside closure: \(pokemon)")
    }
    print("bye")
}

func demo2() {
    var pokemon = Pokemon(name: "Pikachu")
    print("before closure: \(pokemon)")
    delay(1) {
        print("inside closure: \(pokemon)")
    }
    pokemon = Pokemon(name: "Mewtwo")
    print("after closure: \(pokemon)")
}

func demo3() {
    var value = 42
    print("before closure: \(value)")
    delay(1) {
        print("inside closure: \(value)")
    }
    value = 1337
    print("after closure: \(value)")
}

func demo4() {
    var value = 42
    print("before closure: \(value)")
    delay(1) {
        print("inside closure 1, before change: \(value)")
        value = 1337
        print("inside closure 1, after change: \(value)")
    }
    delay(2) {
        print("inside closure 2: \(value)")
    }
}

func demo5() {
    var value = 42
    print("before closure: \(value)")
    delay(1) { [constValue = value] in
        print("inside closure: \(constValue)")
    }
    value = 1337
    print("after closure: \(value)")
}

func demo6() {
    var pokemon = Pokemon(name: "Pikachu")
    print("before closure: \(pokemon)")
    delay(1) { [pokemonCopy = pokemon] in
        print("inside closure: \(pokemonCopy)")
    }
    pokemon = Pokemon(name: "Mewtwo")
    print("after closure: \(pokemon)")
}

func demo7() {
    var pokemon = Pokemon(name: "Mew")
    print("➡️ Initial pokemon is \(pokemon)")

    delay(1) { [capturedPokemon = pokemon] in
        print("closure 1 — pokemon captured at creation time: \(capturedPokemon)")
        print("closure 1 — variable evaluated at execution time: \(pokemon)")
        pokemon = Pokemon(name: "Pikachu")
        print("closure 1 - pokemon has been now set to \(pokemon)")
    }

    pokemon = Pokemon(name: "Mewtwo")
    print("🔄 pokemon changed to \(pokemon)")

    delay(2) { [capturedPokemon = pokemon] in
        print("closure 2 — pokemon captured at creation time: \(capturedPokemon)")
        print("closure 2 — variable evaluated at execution time: \(pokemon)")
        pokemon = Pokemon(name: "Charizard")
        print("closure 2 - value has been now set to \(pokemon)")
    }
}

//demo3()


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

test6()