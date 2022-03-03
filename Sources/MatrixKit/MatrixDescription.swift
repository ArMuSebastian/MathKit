struct StringTable {

    let accessory: TableAccessory

    init(
        accessory: TableAccessory
    ) {
        self.accessory = accessory
    }

    func string(from data: [[CustomStringConvertible]]) -> String {
        var kekw: [[CustomStringConvertible]]? = nil
        if case let .anything(something) = accessory.rowNamePredicate {
            kekw = [something]
        }

        let newData: [[CustomStringConvertible]]
        if let kekw = kekw {
            newData = kekw + data
        } else {
            newData = data
        }

        var prepended: [CustomStringConvertible] = []

        if case let .anything(something) = accessory.columnNamePredicate {
            prepended = something
        }

        if case let .anything(something) = accessory.divider {
            prepended = [something] + prepended
        }
        
        let newnewData = newData
            .enumerated()
            .map { index, p in
                [prepended[index]] + p
        }

        let maxElementsInRow = newnewData
            .map(\.count)
            .reduce(0, max)

        let infos = newnewData.map { data in
            printInfo(for: data, elementsCount: maxElementsInRow)
        }

        let colWidths = infos
            
            .reduce(into: Array(repeating: 0, count: maxElementsInRow)) { result, info in
                info.widths
                    .enumerated()
                    .forEach { index, value in
                    result[index] = max(result[index], value)
                }
            }

        let sstrings = infos.map { info in
            info.rowStrings
                .enumerated()
                .map { index, string -> String in
                    let desiredWidth = colWidths[index]
                    return string + String(repeating: " ", count: desiredWidth - string.count)
                }
        }

        let sepAinn = "-+-"
        let sepOut = "---"
        let sepB = " | "
        let sideBlock = "|"

        let aInn = colWidths
            .map { value in
                String(repeating: "-", count: value)
            }
            .innerJoin(by: sepAinn)
            .joined()

        let aOut = colWidths
            .map { value in
                String(repeating: "-", count: value)
            }
            .innerJoin(by: sepOut)
            .joined()

        let stringElements = sstrings
            .map { elements -> Array<String> in
                let w = elements
                    .innerJoin(by: sepB)
                    .joined()
                return [w]
            }
        let kek = stringElements
            .innerJoin(by: [aInn])
            .encapsulated(by: [aOut])

        return kek
            .map { rowComoponents in
                rowComoponents
                    .encapsulated(by: sideBlock)
                    .joined()
            }
            .joined(separator: "\n")
    }

    func printInfo(
        for data: [CustomStringConvertible],
        elementsCount: Int
    ) -> StringInfo {
        var strings = data.map(String.init(describing:))
        if strings.count < elementsCount {
            strings.append(contentsOf: Array(repeating: "-", count: elementsCount - strings.count))
        }

        return StringInfo(
            rowStrings: strings,
            widths: strings.map(\.count)
        )
    }

}

struct StringInfo {

    var rowStrings: [String]
    var widths: [Int]

}

struct TableAccessory {

    var rowNamePredicate: TableRowName
    var columnNamePredicate: TableColumnName
    var divider: RowColumnDivider

    public init() {
        self.init(
            rowNamePredicate: .none
        )
    }

    public init(
        columnNamePredicate: TableColumnName
    ) {
        self.init(
            rowNamePredicate: .none,
            columnNamePredicate: columnNamePredicate
        )
    }

    public init(
        rowNamePredicate: TableRowName
    ) {
        self.init(
            rowNamePredicate: rowNamePredicate,
            columnNamePredicate: .none
        )
    }

    public init(
        rowNamePredicate: TableRowName,
        columnNamePredicate: TableColumnName
    ) {
        self.init(
            rowNamePredicate: rowNamePredicate,
            columnNamePredicate: columnNamePredicate,
            divider: .none
        )
    }

    public init(
        rowNamePredicate: TableRowName,
        columnNamePredicate: TableColumnName,
        divider: RowColumnDivider
    ) {
        self.rowNamePredicate = rowNamePredicate
        self.columnNamePredicate = columnNamePredicate
        self.divider = divider
    }
}

enum RowColumnDivider {

    case backslash
    case anything(something: CustomStringConvertible)
    case none

}

enum TableRowName {

    case letter
    case anything(something: [CustomStringConvertible])
    case none

}

enum TableColumnName {

    case number
    case anything(something: [CustomStringConvertible])
    case none

}

extension Array {

    func encapsulated(by element: Element) -> Array<Element> {
        [
            [element],
            self,
            [element],
        ]
            .flatMap { $0 }
    }

    func innerJoin(by element: Element) -> Array<Element> {
        let s = self
            .map(CollectionOfOne.init)
            .joined(separator: CollectionOfOne(element))
            .compactMap { $0 }
        return Array(s)
    }

}
