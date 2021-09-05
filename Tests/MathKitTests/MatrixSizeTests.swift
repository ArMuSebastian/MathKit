import XCTest
import MathKit

final class MatrixSizeTests: XCTestCase {

    // no initialSize
    // static payload
    // static comparedSize
    func testMatrixPayoadCreatesCorrectMatrixSizeWithNonDesiredSizeNonRandomMatrixValues() {

        let payload = TestableThings.Payload.Correct.staticInt1()

        let matrix = try! Matrix(with: payload)

        XCTAssertEqual(matrix.size, .init(rows: 5, columns: 9))

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
        let desiredMatrixSize1 = Size(rows: 5, columns: 5)
        let desiredMatrixSize2 = Size(rows: 6, columns: 6)

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

        let matrices = [matrix1, matrix2, matrix3, matrix4]
        let sizes = matrices.map { $0.size }

        let allEqual = Set(sizes).count == 1

        XCTAssertTrue(allEqual)

    }

    func testAnyMatrixZiseHasZeroStart() {

        typealias Type = Int
        let size = TestableThings.Size.random()

        XCTAssertEqual(size.startIndex, TestableThings.Position.zero())
    }

}
