//
//  MatrixSize.swift
//  
//
//  Created by Artem Myshkin on 18.07.2021.
//

import Foundation

public struct Size {

    public private(set) var rows: Int
    public private(set) var columns: Int

    public var count: Int {
        self.rows * self.columns
    }

    public init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
    }

}

extension Size {

    internal var startIndex: Index {
        return Index(row: 0, column: 0)
    }

    internal var endIndex: Index {
        return Index(row: rows - 1, column: columns - 1)
    }

    public func contains(_ index: Index) -> Bool {
        if (self.startIndex.row..<self.endIndex.row) ~= index.row,
           (self.startIndex.column..<self.endIndex.column) ~= index.column {
            return true
        } else {
            return false
        }
    }

}

extension Size: Hashable {

}

extension Size: Equatable {

    public static func ==(lgs: Size, rgs: Size) -> Bool {
        return lgs.columns == rgs.columns && lgs.rows == rgs.rows
    }

}

extension Size: CustomStringConvertible {

    public var description: String {
        return "(rows: \(rows), columns: \(columns))"
    }

}
