//
//  MatrixIndex.swift
//  
//
//  Created by Artem Myshkin on 18.07.2021.
//

import Foundation

public struct Index {

    public var row: Int
    public var column: Int
    
    public init(row: Int, column: Int) {
        self.row = row
        self.column = column
    }

}

extension Index: Comparable {

    public static func < (lhs: Index, rhs: Index) -> Bool {
        if lhs == rhs {
            return false
        } else if lhs.row < rhs.row {
            return true
        } else if lhs.row == rhs.row && lhs.column < rhs.column {
            return true
        } else {
            return false
        }
    }

}

extension Index: Hashable {

}

extension Index: Equatable {

    public static func ==(lgs: Index, rgs: Index) -> Bool {
        return lgs.column == rgs.column && lgs.row == rgs.row
    }

}

extension Index: CustomStringConvertible {

    public var description: String {
        return "(row: \(row), column: \(column))"
    }

}
