//
//  MatrixError.swift
//  
//
//  Created by Artem Myshkin on 18.07.2021.
//

import Foundation

extension Matrix {

    public enum Error: Swift.Error {
        case invalidPayload(_ payload: Matrix.Payload)
        case invalidIndex(_ martixSize: Size, _ matrixPosition: Index)
    }

}

extension Matrix.Error: LocalizedError {

    public var errorDescription: String? {
        switch self {
        case let .invalidPayload(payload):
            return "Matrix construct: Unable to initialize matrix with non-matrix convertible two-dimensional array." + "\n Payload: \n" + beautyUp(payload)
        case let .invalidIndex(matrixSize, matrixIndex):
            return "Matrix invalid index: Unable to retrieve element with index \(matrixIndex) in matrix of size \(matrixSize)"
        }
    }

    private func beautyUp(_ payload: Matrix.Payload) -> String {
        payload.map {
                "| "
                +
                $0.map { String(describing: $0) }
                .joined(separator: ", ")
                +
                " |"
        }.joined(separator: "\n")
    }

}
