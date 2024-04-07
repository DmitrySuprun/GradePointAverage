//
//  ButtonType.swift
//  GradePointAverage
//
//  Created by Dmitriy Suprun on 7.04.24.
//

import Foundation
import SwiftUI

enum ButtonType: Hashable, CustomStringConvertible {
    case grade(_ grade: Grade?)
    case memory(_ memory: Memory)
    case settings
    case back
    case clear
    case reserve
    
    var description: String {
        switch self {
        case .grade(let digit):
            return digit?.description ?? ""
        case .memory(let memory):
            return memory.description
        case .settings:
            return "⚙"
        case .back:
            return "←"
        case .clear:
            return "C"
        case .reserve:
            return "?"
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .memory:
            return Color(.lightGray)
        case .grade:
            return .secondary
        default:
            return .orange
        }
    }
    
    var foregroundColor: Color {
        switch self {
        case .grade:
            return .white
        default:
            return .black
        }
    }
}
