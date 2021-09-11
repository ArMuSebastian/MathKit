import XCTest
import MathKit

final class RadixTests: XCTestCase {

    func testRadixCreateArrayOfNumbersFromInt() {
        let arr = [1, 2, 4, 0,  8]
        let arry = RadixCoder.array(from: 525345, usingRadix: .f)

        XCTAssertEqual(arr, arry)
    }

    func testRadixCreateIntFromArray() {
        let num = 525345
        let numy = RadixCoder.int(from: [1, 2, 4, 0, 8])

        XCTAssertEqual(num, numy.payload)
    }

}
