//
//  RadixCoder.swift
//  
//
//  Created by Artem Myshkin on 05.09.2021.
//

import Foundation

public struct RadixCoder {

    public func array(from number: Int, usingRadix radix: Radix) -> [Int] {
        var ints: [Int] = []

        var mutatingNumber = number
        while mutatingNumber != 0 {

            ints.append(mutatingNumber & radix.max)
            mutatingNumber = mutatingNumber >> radix.rawValue

        }

        return ints
    }

}
