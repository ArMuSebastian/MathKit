import struct MathKit.Size

extension TestableThings {

    struct Size {

        private init() {}

        static func random() -> MathKit.Size {
            return .init(rows: .random(), columns: .random())
        }

    }

}
