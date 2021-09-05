import Foundation

protocol Randomable {

    static func random() -> Self

}

protocol MatrixElementable: Randomable {

}

extension Int: MatrixElementable {

    static func random() -> Int {
        return .random(in: 0...100)
    }

}