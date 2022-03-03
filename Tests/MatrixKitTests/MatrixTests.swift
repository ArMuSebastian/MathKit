import XCTest

final class MatrixPositionTests: XCTestCase {

    func testMatrixCreateFromPayloadSuccess() {

        let payload = TestableThings.Payload.Correct.staticInt1()
        let matrix = TestableThings.Matrix.fromPayload(payload: payload)

        XCTAssertNotEqual(matrix.size.count, 0)
    }

    func testMatrixPayloadCreateCorrect() {

        let payload = TestableThings.Payload.Correct.staticInt2()
        let matrix = TestableThings.Matrix.fromPayload(payload: payload)

        XCTAssertNotEqual(matrix.size.count, 0)
    }

    func testMatrixCreateFromPayloadNoSuccess() {

        let payload = TestableThings.Payload.Incorrect.staticInt1()
        let matrix = TestableThings.Matrix.fromPayload(payload: payload)

        XCTAssertEqual(matrix.size.count, 0)
    }

}
