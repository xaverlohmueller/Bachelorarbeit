import Foundation

public class Pokemon: CustomDebugStringConvertible {
    public var name: String
    public init(name: String) {
        self.name = name
    }
    public var debugDescription: String { return "<Pokémon \(name)>" }
    deinit { print("\(self) escaped!") }
}

public struct Attack: CustomDebugStringConvertible {
    public var name: String
    public init(name: String) {
        self.name = name
    }
    public var debugDescription: String { return "Used \(name)!" }
}

public func delay(seconds: NSTimeInterval, closure: ()->()) {
    let time = dispatch_time(DISPATCH_TIME_NOW, Int64(seconds * Double(NSEC_PER_SEC)))
    dispatch_after(time, dispatch_get_main_queue()) {
        print("🕑 \(seconds) seconds passed 🕑")
        closure()
    }
}

public class HeapBox<T> {
    public var content: T
    public init(content: T) {
        self.content = content
    }
    deinit { print("\(content) got released") }
}

public struct StackBox<T> {
    public var content: T
    public init(content: T) {
        self.content = content
    }
}
