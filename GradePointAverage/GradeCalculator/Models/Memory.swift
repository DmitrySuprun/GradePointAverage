//
//  Memory.swift
//  GradePointAverage
//
//  Created by Dmitriy Suprun on 7.04.24.
//

enum Memory: CustomStringConvertible {
    case m1, m2, m3
    
    var description: String {
        switch self {
        case .m1:
            return "M1"
        case .m2:
            return "M2"
        case .m3:
            return "M3"
        }
    }
}
