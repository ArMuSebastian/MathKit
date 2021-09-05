//
//  Array+extension.swift
//  
//
//  Created by Artem Myshkin on 18.07.2021.
//

import Foundation

extension Array where Element: Collection {

    /// A simple check to determine if a matrix could be build from two-dimential array
    internal var isValidMatrixPayload: Bool {

        let rowsSize = self.count

        let columnsSizes = self.map { $0.count }

        let nonSimilarColumnSizes = Set(columnsSizes)

        return
            // There are more than 0 rows
            (rowsSize > 0)
            &&
            // All columnSizes are the same
            (Set(nonSimilarColumnSizes).count == 1)
            &&
            // There are more than 0 columns
            (nonSimilarColumnSizes.first ?? 0 > 0)
    }

}
