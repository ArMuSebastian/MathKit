//
//  Matrix+equatable.swift
//  
//
//  Created by Artem Myshkin on 11.09.2021.
//

extension Matrix: Equatable where Element: Equatable {

    public static func == (lhs: Matrix, rhs: Matrix) -> Bool {

        guard lhs.size == rhs.size else { return false }

        for index in lhs.indices {

            guard lhs[index] == rhs[index] else { return false }

        }

        return true
    }

}
