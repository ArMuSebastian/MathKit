import XCTest
import MathKit

final class MatrixCreationTests: XCTestCase {

    func testMatrixIndicesNotEqual() {

        let position1: Index = TestableThings.Position.predefined1()
        let position2: Index = TestableThings.Position.zero()

        XCTAssertNotEqual(position1, position2)
    }

    func testMatrixIndicesEqual() {

        XCTAssertEqual(TestableThings.Position.zero(), TestableThings.Position.zero())
    }

    func testIndexLess() {

        XCTAssertTrue(TestableThings.Position.zero() < .init(row: 1, column: 0))
        XCTAssertTrue(TestableThings.Position.zero() < .init(row: 0, column: 1))
    }

    func testIndexMore() {

        XCTAssertFalse(TestableThings.Position.zero() > .init(row: 1, column: 0))
        XCTAssertFalse(TestableThings.Position.zero() > .init(row: 0, column: 1))
    }

    func testIndexEqual() {

        XCTAssertFalse(TestableThings.Position.zero() > TestableThings.Position.zero())
        XCTAssertFalse(TestableThings.Position.zero() < TestableThings.Position.zero())
    }

}
