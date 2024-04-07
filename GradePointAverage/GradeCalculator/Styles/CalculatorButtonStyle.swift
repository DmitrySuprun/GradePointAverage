//
//  CalculatorButtonStyle.swift
//  GradePointAverage
//
//  Created by Dmitriy Suprun on 7.04.24.
//

import SwiftUI

struct CalculatorButtonStyle: ButtonStyle {
    
    var size: CGFloat
    var backgroundColor: Color
    var foregroundColor: Color
    var isWide: Bool = false
    
    func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .font(.system(size: 32, weight: .medium))
                .frame(width: size, height: size)
                .frame(maxWidth: isWide ? .infinity : size, alignment: .center)
                .background(backgroundColor)
                .foregroundColor(foregroundColor)
                .overlay {
                    if configuration.isPressed {
                        Color(white: 1.0, opacity: 0.2)
                    }
                }
                .clipShape(Capsule())
    }
}

struct CalculatorButtonStyle_Previews: PreviewProvider {
    static let buttonType: ButtonType = .grade(Grade(description: "5")!)
    
    static var previews: some View {
        VStack {
            Button(buttonType.description) { }
                .buttonStyle(CalculatorButtonStyle(
                    size: 80,
                    backgroundColor: buttonType.backgroundColor,
                    foregroundColor: buttonType.foregroundColor,
                    isWide: true
                ))
                .padding()
        }
    }
}
