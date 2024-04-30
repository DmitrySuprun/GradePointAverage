//
//  ButtonType.swift
//  GradePointAverage
//
//  Created by Dmitriy Suprun on 7.04.24.
//

import Foundation
import SwiftUI

private extension Constants {
    static let memoryButtonFont = Font.system(size: 42, weight: .regular)
    static let padButtonFont = Font.system(size: 30, weight: .medium)
    static let systemButtonFont = Font.system(size: 35, weight: .medium)

}

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
    
    var selectedBackgroundColor: Color {
        switch self {
        case .memory:
            return .gray
        case .grade:
            return .secondary
        default:
            return .orange
        }
    }
    
    var selectedForegroundColor: Color {
        switch self {
        case .memory:
            return .gray
        case .grade:
            return .secondary
        default:
            return .orange
        }
    }
    
    var buttonFont: Font {
        switch self {
        case .grade:
            return Constants.memoryButtonFont
        case .memory:
            return Constants.systemButtonFont
        default:
            return Constants.padButtonFont
        }
    }
}
