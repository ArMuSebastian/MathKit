//
//  Matrix.swift
//  
//
//  Created by Artem Myshkin on 18.07.2021.
//

import Foundation

/// Matrix is a simple struct build upon two-dimensional array
public struct Matrix<Element> {

    /// Simplified alias for two-dimensional array
    public typealias Payload = [[Element]]

    /// Values of matrix stored in two-dimensional array
    public private(set) var payload: Payload

    // MARK: - inits
    /// - Parameters:
    ///   - payload: two-dimensional array
    /// - Throws: Matrix.Error.invalidPayload if *payload* is not matrix compatible
    public init(with payload: Payload) throws {
        guard payload.isValidMatrixPayload else {
            throw Matrix.Error.invalidPayload(payload)
        }
        self.payload = payload
    }

}

// MARK: - Subscripts
extension Matrix {

    public subscript(index: Index) -> Element {
        get {
            self.payload[index.row][index.column]
        }
        set {
            self.payload[index.row][index.column] = newValue
        }
    }

    private subscript(safe index: Index) -> Element? {
        get {
            if !self.size.contains(index) {
                return nil
            } else {
                return self[index]
            }
        }
    }

    public subscript(_ indices: [Index]) -> [Element] {
        indices.map { self[$0] }
    }

}

// MARK: - Indexing
extension Matrix {

    public typealias Index = MathKit.Index
    public typealias Element = Element

    public var size: Size {
        return Size(
            rows: payload.count,
            columns: payload.first!.count
        )
    }

    public var startIndex: Index {
        return self.size.startIndex
    }

    public var endIndex: Index {
        return self.size.endIndex
    }

    public var indices: ClosedRange<Index> {
        startIndex...endIndex
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

// MARK: - Sequence
extension Matrix: Sequence {

    public func makeIterator() -> AnyIterator<Element> {

        var currentIndex: Index? = self.size.startIndex

        return AnyIterator {
            defer {
                currentIndex = currentIndex.flatMap(_index(after:))
            }

            return currentIndex.flatMap { self[safe: $0] }
        }
    }

}

// MARK: - Collection
extension Matrix: Collection {

}

// MARK: - BidirectionalCollection
extension Matrix: BidirectionalCollection {

}

// MARK: - RandomAccessCollection
extension Matrix: RandomAccessCollection {

}

// MARK: - CustomStringConvertible
extension Matrix: CustomStringConvertible where Element: CustomStringConvertible {

    public var description: String {

        return payload.map {
                "| "
                +
                $0.map { String(describing: $0) }
                .joined(separator: ", ")
                +
                " |"
        }.joined(separator: "\n")
    }

}
