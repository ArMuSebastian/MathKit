extension TestableThings {

    struct Position {

        private init() {}

        static func random() -> Index {
            return Index(row: .random(), column: .random())
        }

        static func zero() -> Index {
            return Index(row: 0, column: 0)
        }

        static func predefined1() -> Index {
            return Index(row: 2, column: 5)
        }

    }

}
