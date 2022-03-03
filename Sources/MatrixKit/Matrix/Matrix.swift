//
//  Matrix.swift
//  
//
//  Created by Artem Myshkin on 18.07.2021.
//

import Foundation

public struct Matrix<Element> {

    public typealias TwoDimensionalArray<T> = [[T]]
    public typealias Payload = TwoDimensionalArray<Element>

    private var elements: [Index: Element]
    private var _indices: [Index]
    private var _size: Size

}

// MARK: - Inits
extension Matrix {

    public init(
        with payload: Payload
    ) {
        self.init(elements: payload)
    }

    public init(
        elements: Payload
    ) {
        let _elements = elements
            .filter(\.isNotEmpty)

        let hasEqualRowSize = Set(_elements.map(\.count)).count == 1

        let payload: [[Element]]
        if hasEqualRowSize {
            payload = _elements.compactMap { $0 }
        } else {
            payload = []
        }

        self.init(
            elementsPayload: payload
        )
    }

    private init(
        elementsPayload: Payload
    ) {
        let w: [(key: Index, value: Element)] = elementsPayload
            .enumerated()
            .map { rowIndex, rowElements in
                rowElements
                    .enumerated()
                    .map { columnIndex, matrixElement in
                        (Index(row: rowIndex, column: columnIndex), matrixElement)
                    }
            }
            .flatMap { $0 }

        self.elements = Dictionary(uniqueKeysWithValues: w)
        self._indices = w.map(\.key)
        self._size = Size(
            rows: elementsPayload.count,
            columns: elementsPayload.first?.count ?? 0
        )
    }

}

// MARK: - Subscripts
extension Matrix {

    private func safeElement(by index: Index) -> Element? {
        self[safe: index]
    }

    private subscript(safe index: Index) -> Element? {
        get {
            self.elements[index]
        }
    }

    public subscript(index: Index) -> Element {
        get {
            safeElement(by: index)!
        }
    }

    public subscript(indices: [Index]) -> [Element] {
        indices
            .map(self.safeElement(by:))
            .map(\.unsafelyUnwrapped)
    }

    public subscript(safe indices: [Index]) -> [Element] {
        indices
            .compactMap(self.safeElement(by:))
    }

}

// MARK: - Index
extension Matrix {

    public typealias Index = MatrixKit.Index
    public typealias Element = Element

    public var size: Size {
        self._size
    }

    public var indices: [Index] {
        self._indices
    }

    public var startIndex: Index {
        return self.indices.first ?? Index(row: 0, column: 0)
    }

    public var endIndex: Index {
        return self.indices.last ?? Index(row: 0, column: 0)
    }


    public func index(after i: Index) -> Index {
        return _index(after: i)!
    }

    private func _index(after i: Index) -> Index? {
        let nextIndex: Index?
        if i.column < self.size.endIndex.column {
            nextIndex = Index(
                row: i.row,
                column: i.column + 1
            )
        } else if i.row < self.size.endIndex.row {
            nextIndex = Index(
                row: i.row + 1,
                column: self.size.startIndex.column
            )
        } else {
            nextIndex = nil
        }
        return nextIndex
    }

    public func index(before i: Index) -> Index {
        return _index(before: i)!
    }

    public func _index(before i: Index) -> Index? {
        let prevIndex: Index?
        if i.column > self.size.startIndex.column {
            prevIndex = Index(
                row: i.row,
                column: i.column - 1
            )
        } else if i.row > self.size.startIndex.row {
            prevIndex = Index(
                row: i.row - 1,
                column: self.size.endIndex.column
            )
        } else {
            prevIndex = nil
        }
        return prevIndex
    }

}

//// MARK: - Collection
//extension _Matrix: Collection {
//
//}
//
//// MARK: - BidirectionalCollection
//extension _Matrix: BidirectionalCollection {
//
//}
//
//// MARK: - RandomAccessCollection
//extension _Matrix: RandomAccessCollection {
//
//}

// MARK: - CustomStringConvertible
extension Matrix: CustomStringConvertible where Element: CustomStringConvertible {

    public var description: String {
        let elements = self[self.indices]
            .chunked(by: self.size.columns)

        return StringTable(
            accessory: TableAccessory(
                rowNamePredicate: .anything(something: Array((0 + 1)..<(elements.count + 1))),
                columnNamePredicate: .anything(something: Array((0 + 1)..<((elements.first?.count ?? 0) + 1))),
                divider: .anything(something: "Row \\ Column")
            )
        )
            .string(from: elements)
    }

}
