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

    public init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
    }

    public func contains(_ index: Index) -> Bool {
        if (0..<self.rows) ~= index.row,
           (0..<self.columns) ~= index.column {
            return true
        } else {
            return false
        }
    }

    public var startIndex: Index {
        return Index(row: 0, column: 0)
    }

    public var endIndex: Index {
        return Index(row: rows - 1, column: columns - 1)
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
