import Foundation

public protocol NilableType {
    var isNil: Bool { get }
    mutating func setToNil()
}

extension Optional: NilableType {
    public var isNil: Bool { self == nil }
    public mutating func setToNil() { self = nil }
}

public protocol EmptiableType {
    var isEmpty: Bool { get }
}

extension Int: EmptiableType {
    public var isEmpty: Bool { self == 0 }
}
extension Int8: EmptiableType {
    public var isEmpty: Bool { self == 0 }
}
extension Int16: EmptiableType {
    public var isEmpty: Bool { self == 0 }
}
extension Int32: EmptiableType {
    public var isEmpty: Bool { self == 0 }
}
extension Int64: EmptiableType {
    public var isEmpty: Bool { self == 0 }
}
extension UInt: EmptiableType {
    public var isEmpty: Bool { self == 0 }
}
extension UInt8: EmptiableType {
    public var isEmpty: Bool { self == 0 }
}
extension UInt16: EmptiableType {
    public var isEmpty: Bool { self == 0 }
}
extension UInt32: EmptiableType {
    public var isEmpty: Bool { self == 0 }
}
extension UInt64: EmptiableType {
    public var isEmpty: Bool { self == 0 }
}
extension Float: EmptiableType {
    public var isEmpty: Bool { self.isZero }
}
extension Double: EmptiableType {
    public var isEmpty: Bool { self.isZero }
}
extension String: EmptiableType {}
extension Array: EmptiableType {}
extension Dictionary: EmptiableType {}
extension Optional: EmptiableType {
    public var isEmpty: Bool {
        switch self {
        case .some(let value as EmptiableType): return value.isEmpty
        case .some: return false
        case .none: return true
        }
    }
}
