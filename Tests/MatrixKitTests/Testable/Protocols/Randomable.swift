protocol Randomable {

    static func random() -> Self

}

protocol MatrixElementable: Randomable {

}

extension Int: MatrixElementable {

    static func random() -> Int {
        return Int.random(in: 10...99)
    }

}
