//
//  ButtonType.swift
//  GradePointAverage
//
//  Created by Dmitriy Suprun on 7.04.24.
//

import Foundation
import SwiftUI

/// Calculator Bytton type
enum ButtonType: Hashable, CustomStringConvertible {
    case grade(_ grade: Grade?)
    case memory(_ memory: Memory)
    case settings
    case up
    case down
    case back
    case clear
    
    var description: String {
        switch self {
        case .grade(let digit):
            return digit?.description ?? ""
        case .memory(let memory):
            return memory.description
        case .settings:
            return "⛭"
        case .up:
            return "△"
        case .down:
            return "▽"
        case .back:
            return "←"
        case .clear:
            return "C"
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .memory:
            return .gray
        case .grade:
            return .secondary
        default:
            return .orange
        }
    }
    
    var foregroundColor: Color {
        switch self {
        case .memory(_):
            return .black
        default:
            return .white
        }
    }
}
