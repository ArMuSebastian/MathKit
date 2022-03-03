extension TestableThings {

    struct Matrix {

        private init() {}

        static func random<T: MatrixElementable>() -> MatrixKit.Matrix<T> {
            
            return random(of: TestableThings.Size.random())
        }

        static func random<T: MatrixElementable>(of size: MatrixKit.Size) -> MatrixKit.Matrix<T> {
            
            let payload = (0..<size.rows).map { _ in
                (0..<size.columns).map { _ in
                    T.random()
                }
            }

            return fromPayload(payload: payload)
        }

        static func fromPayload<T: MatrixElementable>(payload: MatrixKit.Matrix<T>.Payload) -> MatrixKit.Matrix<T> {

            return .init(with: payload)
        }
    }

}
