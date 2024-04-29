//
//  CalculatorButtonStyle.swift
//  GradePointAverage
//
//  Created by Dmitriy Suprun on 7.04.24.
//

import SwiftUI

private extension Constants {
    static let pressedColorWhite = 1.0
    static let pressedColorOpacity = 0.2
    static let buttonFont = Font.system(size: 42, weight: .regular)
}

/// Button style
struct CalculatorButtonStyle: ButtonStyle {
    
    // MARK: - Properties
    
    var size: CGFloat
    var backgroundColor: Color
    var foregroundColor: Color
    var isWide: Bool = false
    
    // MARK: - Public
    
    func makeBody(configuration: Configuration) -> some View {
            configuration.label
            .font(Constants .buttonFont)
                .frame(width: size, height: size)
                .frame(maxWidth: isWide ? .infinity : size, alignment: .center)
                .background(backgroundColor)
                .foregroundColor(foregroundColor)
                .overlay {
                    if configuration.isPressed {
                        Color(white: Constants.pressedColorWhite, opacity: Constants.pressedColorOpacity)
                    }
                }
                .clipShape(Capsule())
    }
}

// MARK: - Preview

struct CalculatorButtonStyle_Previews: PreviewProvider {
    static let buttonType: ButtonType = .grade(Grade(description: "5")!)
    
    static var previews: some View {
        VStack {
            Button(buttonType.description) { }
                .buttonStyle(CalculatorButtonStyle(
                    size: 76,
                    backgroundColor: buttonType.backgroundColor,
                    foregroundColor: buttonType.foregroundColor,
                    isWide: true
                ))
                .padding()
        }
    }
}
