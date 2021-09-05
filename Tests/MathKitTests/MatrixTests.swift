import XCTest
import MathKit

final class MatrixPositionTests: XCTestCase {

    func testMatrixCreateFromPayloadSuccess() {

        let payload = TestableThings.Payload.Correct.staticInt1()

        XCTAssertNoThrow(try Matrix(with: payload))
    }

    func testMatrixPayloadCreateCorrect() {

        let payload = TestableThings.Payload.Correct.staticInt2()

        XCTAssertNoThrow(try Matrix(with: payload))
    }

    func testMatrixCreateFromPayloadNoSuccess() {

        let payload = TestableThings.Payload.Incorrect.staticInt1()

        XCTAssertThrowsError(try Matrix(with: payload))
    }

    func testAnyMatrixHasZeroStart() {

        typealias Type = Int
        let matrix: Matrix<Type> = TestableThings.Matrix.random()

        XCTAssertEqual(matrix.size.startIndex, TestableThings.Position.zero())
    }

}
