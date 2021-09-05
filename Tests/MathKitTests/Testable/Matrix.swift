import struct MathKit.Matrix
import struct MathKit.Size

extension TestableThings {

    struct Matrix {

        private init() {}

        static func random<T: MatrixElementable>() -> MathKit.Matrix<T> {
            
            return random(of: TestableThings.Size.random())
        }

        static func random<T: MatrixElementable>(of size: MathKit.Size) -> MathKit.Matrix<T> {
            
            let payload = (0..<size.rows).map { _ in
                (0..<size.columns).map { _ in
                    T.random()
                }
            }

            return try! .init(with: payload)
        }
    }

}
