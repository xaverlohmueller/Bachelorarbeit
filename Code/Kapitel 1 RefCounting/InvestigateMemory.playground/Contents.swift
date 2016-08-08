extension UnsignedIntegerType {
	func hex(length: Int = 16) -> String {
		var hexValue = String(self, radix: 16)
		while (hexValue.characters.count < length) {
			hexValue = "0" + hexValue
		}
		return "0x" + hexValue.uppercaseString
	}
}

typealias Pointer = UnsafePointer<UInt64>

class SomeClass {
	var someValue = 0xf0f0f0f0
	var anotherValue = 0x12345
}

let anInstance = SomeClass()

let size = sizeofValue(anInstance)

let pointer = unsafeBitCast(anInstance, Pointer.self)

pointer.memory.hex()

pointer.successor().memory.hex()
pointer.successor().successor().memory.hex()

pointer[0].hex()
pointer[1].hex()
pointer[2].hex()
pointer[3].hex()
