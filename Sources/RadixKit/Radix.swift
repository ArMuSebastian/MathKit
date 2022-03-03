//
//  Radix.swift
//  
//
//  Created by Artem Myshkin on 05.09.2021.
//

import Foundation

public enum Radix: Int {

    case b = 2
    case f = 4
    case o = 8
    case h = 16

    var max: Int {
        (0..<self.rawValue).reduce(0) { result, _ in
            return (result << 1) + 1
        }
    }

}
