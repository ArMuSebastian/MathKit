import XCTest

final class MatrixSizeTests: XCTestCase {

    // no initialSize
    // static payload
    // static comparedSize
    func testMatrixPayoadCreatesCorrectMatrixSizeWithNonDesiredSizeNonRandomMatrixValues() {

        typealias Type = Int

        let payload: Matrix<Type>.Payload = TestableThings.Payload.Correct.staticInt1()
        let desiredMatrixSize: Size = TestableThings.Size.certain(rows: payload.count, columns: payload.first!.count)

        let matrix: Matrix<Type> = TestableThings.Matrix.fromPayload(payload: payload)

        XCTAssertEqual(matrix.size, desiredMatrixSize)

    }

    // initialSize
    // random payload
    // random-based-payload comparedSize
    func testMatrixPayoadCreatesCorrectMatrixSizeWithDesiredSizeRandomMatrixValues() {

        typealias Type = Int
        let desiredMatrixSize: Size = TestableThings.Size.random()

        let matrix: Matrix<Type> = TestableThings.Matrix.random(of: desiredMatrixSize)

        XCTAssertEqual(matrix.size, desiredMatrixSize)

    }

    // static-initialSize x2
    func testMatrixPayoadCreatesCorrectMatrixSizeWithDesiredSizesRandomMatrixValues() {

        typealias Type = Int
        let desiredMatrixSize1: Size = TestableThings.Size.certain(rows: 5, columns: 5)
        let desiredMatrixSize2: Size = TestableThings.Size.certain(rows: 6, columns: 6)

        let matrix1: Matrix<Type> = TestableThings.Matrix.random(of: desiredMatrixSize1)
        let matrix2: Matrix<Type> = TestableThings.Matrix.random(of: desiredMatrixSize2)

        XCTAssertNotEqual(matrix1.size, matrix2.size)

    }

    // one random matrix
    // three random matrix with size based on previous
    func testMatrixAssociativeMatrixSize() {

        typealias Type = Int

        let matrix1: Matrix<Type> = TestableThings.Matrix.random()
        let matrix2: Matrix<Type> = TestableThings.Matrix.random(of: matrix1.size)
        let matrix3: Matrix<Type> = TestableThings.Matrix.random(of: matrix2.size)
        let matrix4: Matrix<Type> = TestableThings.Matrix.random(of: matrix3.size)

        let matrices: [Matrix<Type>] = [matrix1, matrix2, matrix3, matrix4]
        let sizes: [Size] = matrices.map { $0.size }

        let allEqual: Bool = Set(sizes).count == 1

        XCTAssertTrue(allEqual)

    }

    func testAnyMatrixZiseHasZeroStart() {

        typealias Type = Int

        let size: Size = TestableThings.Size.random()
        let martix: Matrix<Type> = TestableThings.Matrix.random(of: size)

        XCTAssertEqual(martix.startIndex, TestableThings.Position.zero())
    }

    func testMatrixIndicesEqualsSizeCount() {

        typealias Type = Int

        let matrix: Matrix<Type> = TestableThings.Matrix.random()

        XCTAssertEqual(matrix.indices.count, matrix.size.count)
    }

    func testMapsProducesSameAmounOfElements() {

        typealias Type = Int

        let matrix: Matrix<Type> = TestableThings.Matrix.random()

        let elementsCount =
        [
            matrix.indices.count,
            matrix.size.count,
//            matrix.map { $0 }.count,
//            matrix.flatMap { $0 }.count,
//            matrix.compactMap { $0 }.count
        ]

        XCTAssertEqual(Set(elementsCount).count, 1)
    }

}
