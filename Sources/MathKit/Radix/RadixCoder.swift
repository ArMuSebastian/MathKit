//
//  RadixCoder.swift
//  
//
//  Created by Artem Myshkin on 05.09.2021.
//

import Foundation

public struct RadixCoder {

    static
    public func array(from number: Int, usingRadix radix: Radix) -> [Int] {
        var ints: [Int] = []

        var mutatingNumber = number
        while mutatingNumber != 0 {

            ints.append(mutatingNumber & radix.max)
            mutatingNumber = mutatingNumber >> radix.rawValue

        }

        return ints
    }

    static
    public func int(from array: [Int]) -> (payload: Int, radix: Radix) {
        let r = Radix.f

        let int = array
            .reversed()
            .reduce(0) { encoded, newNumber in
                return (encoded << r.rawValue) + newNumber
            }

        return (int, r)
    }

}
