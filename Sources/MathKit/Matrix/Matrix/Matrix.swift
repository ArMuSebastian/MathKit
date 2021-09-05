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
    private var payload: Payload
    /// Matrix size
    public private(set) var size: Size
    
    // MARK: inits

    /// Kekw
    /// - Parameters:
    ///   - payload: two-dimensional array
    /// - Throws: Matrix.Error.invalidPayload if *payload* is not matrix compatible
    public init(with payload: Payload) throws {
        guard payload.isValidMatrixPayload else {
            throw Matrix.Error.invalidPayload(payload)
        }
        let size = Size(rows: payload.count,
                        columns: payload[0].count)
        self.init(with: payload, of: size)
    }

    /// Designated init
    /// - Parameters:
    ///   - payload: two-dimensional matrix compatible array
    ///   - size: size of matrix
    private init(with payload: Matrix.Payload, of size: Size) {
        self.payload = payload
        self.size = size
    }

}

extension Matrix: Sequence {

    public func makeIterator() -> AnyIterator<Element> {

        var currentIndex: Index = self.size.startIndex

        return AnyIterator {

            if !self.size.contains(currentIndex) {
                return nil
            } else {

                let element = self[currentIndex]
                if currentIndex.column < self.size.columns - 1 {
                    currentIndex.column += 1
                } else {
                    currentIndex.row = currentIndex.row + 1
                    currentIndex.column = 0
                }
                return element
            }
        }
    }

}

extension Matrix: Collection {

    public typealias Index = MathKit.Index
    public typealias Element = Element

    public var startIndex: Index {
        return self.size.startIndex
    }

    public var endIndex: Index {
        return self.size.endIndex
    }

    /// Default matrix subscript for matrix
    /// - Parameters:
    ///   - index: a value that contains (row, column) by which element can be found in  matrix
    public subscript(index: Index) -> Element {
        get {
            return payload[index.row][index.column]
        }
        set {
            payload[index.row][index.column] = newValue
        }
    }

    public subscript(_ indices: [Index]) -> [Element] {
        return indices.map { self[$0] }
    }

    // Method that returns the next index when iterating
    public func index(after currentIndex: Index) -> Index {
        let nextIndex: Index
        if currentIndex.column < self.size.columns - 1 {
            nextIndex = Index(row: currentIndex.row,
                              column: currentIndex.column + 1)
        } else {
            nextIndex = Index(row: currentIndex.row + 1,
                              column: 0)
        }
        return nextIndex
    }

}

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
