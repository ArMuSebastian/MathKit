//
//  Step.swift
//  
//
//  Created by Artem Myshkin on 03.08.2021.
//

import Foundation

public extension Axis.Direction {

    struct Step {

        let horisontal: Int
        let vertical: Int

        static
        public func * (
            directionDelta: Step,
            multiplier: Int
        ) -> Step {
            return .init(horisontal: directionDelta.horisontal * multiplier,
                         vertical: directionDelta.vertical * multiplier)
        }

        static
        public func * (
            multiplier: Int,
            directionDelta: Step
        ) -> Step {
            return .init(horisontal: directionDelta.horisontal * multiplier,
                         vertical: directionDelta.vertical * multiplier)
        }

    }

}
