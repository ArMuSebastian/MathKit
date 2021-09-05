import struct MathKit.Matrix

extension TestableThings {

    struct Payload {

        private init() {}

    }

}

extension TestableThings.Payload {

    struct Incorrect {

        private init() {}

        /// Static 5 x 9 payload
        /// * [1, 2, 3, 4, 5, 6, 7, 8, 9]
        /// * [1, 2, 3, 4, 5, 6, 7, 8, 9]
        /// * [1, 2, 3, 4]
        /// * [1, 2, 3, 4, 5, 6, 7, 8, 9]
        /// * [1, 2, 3, 4, 5, 6, 7, 8, 9]
        static func staticInt1() -> MathKit.Matrix<Int>.Payload {
            return [
                    [1, 2, 3, 4, 5, 6, 7, 8, 9],
                    [1, 2, 3, 4, 5, 6, 7, 8, 9],
                    [1, 2, 3, 4],
                    [1, 2, 3, 4, 5, 6, 7, 8, 9],
                    [1, 2, 3, 4, 5, 6, 7, 8, 9],
            ]
        }

    }

}

extension TestableThings.Payload {

    struct Correct {

        private init() {}

        /// Static 5 x 9 payload
        /// * [1, 2, 3, 4, 5, 6, 7, 8, 9]
        /// * [1, 2, 3, 4, 5, 6, 7, 8, 9]
        /// * [1, 2, 3, 4, 5, 6, 7, 8, 9]
        /// * [1, 2, 3, 4, 5, 6, 7, 8, 9]
        /// * [1, 2, 3, 4, 5, 6, 7, 8, 9]
        static func staticInt1() -> MathKit.Matrix<Int>.Payload {
            return [
                [1, 2, 3, 4, 5, 6, 7, 8, 9],
                [1, 2, 3, 4, 5, 6, 7, 8, 9],
                [1, 2, 3, 4, 5, 6, 7, 8, 9],
                [1, 2, 3, 4, 5, 6, 7, 8, 9],
                [1, 2, 3, 4, 5, 6, 7, 8, 9],
            ]
        }

        /// Static 5 x 5 payload
        /// * [1, 2, 3, 4, 5]
        /// * [5, 1, 8, 9, 3]
        /// * [4, 4, 4, 4, 4]
        /// * [2, 6, 5, 6, 0]
        /// * [4, 6, 3, 8, 5]
        static func staticInt2() -> MathKit.Matrix<Int>.Payload {
            return [
                [1, 2, 3, 4, 5],
                [5, 1, 8, 9, 3],
                [4, 4, 4, 4, 4],
                [2, 6, 5, 6, 0],
                [4, 6, 3, 8, 5],
            ]
        }

    }

}
