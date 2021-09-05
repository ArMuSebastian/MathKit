import XCTest
import MathKit

final class RadixTests: XCTestCase {

    func testRadixCreateArrayOfNumbersFromInt() {
        let arr = [1, 2, 4, 0,  8]
        let arry = RadixCoder.array(from: 525345, usingRadix: .f)

        XCTAssertEqual(arr, arry)
    }

}
