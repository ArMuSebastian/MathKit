extension TestableThings {

    struct Size {

        private init() {}

        static func random() -> MatrixKit.Size {
            return certain(rows: .random(), columns: .random())
        }

        static func certain(rows: Int, columns: Int) -> MatrixKit.Size {
            return .init(rows: rows, columns: columns)
        }

    }

}
