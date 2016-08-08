import Foundation

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
    deinit { print("\(content) (Wrapper) deinit call") }
}

public struct StackBox<T> {
    public var content: T
    public init(content: T) {
        self.content = content
    }
}
