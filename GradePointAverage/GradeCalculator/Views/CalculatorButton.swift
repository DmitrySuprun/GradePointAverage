//
//  CalculatorButton.swift
//  GradePointAverage
//
//  Created by Dmitriy Suprun on 7.04.24.
//

import SwiftUI

/// Button
struct CalculatorButton: View {
    
    // MARK: - Properties
    
    let buttonType: ButtonType
    let isWide: Bool
    let action: () -> Void
    
    // MARK: - Init
    
    init(
        buttonType: ButtonType,
        isWide: Bool = false,
        action: @escaping () -> Void
    ) {
        self.buttonType = buttonType
        self.isWide = isWide
        self.action = action
    }
    
    // MARK: - View
    
    var body: some View {
        Button(buttonType.description) {
            action()
        }
        .buttonStyle(CalculatorButtonStyle(
            size: getButtonSize(),
            backgroundColor: getBackgroundColor(),
            foregroundColor: getForegroundColor(),
            isWide: isWide
        ))
    }
    
    // MARK: - Private methods
    
    private func getButtonSize() -> CGFloat {
        let screenWidth = UIScreen.main.bounds.width
        let buttonCount: CGFloat = 4
        let spacingCount = buttonCount + 1
        return (screenWidth - (spacingCount * Constants.buttonPadding)) / buttonCount
    }
    
    private func getBackgroundColor() -> Color {
        return buttonType.backgroundColor
    }
    
    private func getForegroundColor() -> Color {
        return buttonType.foregroundColor
    }
}

// MARK: - Preview

struct CalculatorView_CalculatorButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CalculatorButton(buttonType: .back, isWide: true) {}
            CalculatorButton(buttonType: .grade(Grade(description: "5")!)) {}
        }
        .padding()
    }
}
