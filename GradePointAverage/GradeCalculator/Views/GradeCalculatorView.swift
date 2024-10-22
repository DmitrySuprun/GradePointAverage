//
//  ContentView.swift
//  GradePointAverage
//
//  Created by Dmitriy Suprun on 20.03.24.
//

import SwiftUI

private extension Constants {
    /// Grade
    static let gradeFontSize: CGFloat = 50
    static let gradeFontWeight: Font.Weight = .thin
    static let gradeColor: Color = .white
    static let buttonsRowsCount = 4
    // Information panel
    static let infoPanelColor: Color = .white
    
    static let gradeAverageFormat: String = "%.2f"
    
    static let gradeTextId = "grade"
}

/// Main grade calculator
struct GradeCalculatorView: View {
    
    // MARK: - Properties
    
    @ObservedObject var viewModel: GradeCalculatorViewModel
    
    // MARK: - View
    
    var body: some View {
        VStack {
            InformationPanelView(
                gradePointAverage: viewModel.gradePointAverage,
                gradesCount: viewModel.gradesCount,
                currentMemory: viewModel.currentMemory
            )
            gradeView
            buttonsPad
                .padding(.bottom)
        }
        .padding(Constants.buttonPadding)
        .background(Color.black)
        .sheet(isPresented: $viewModel.isSettingsPresented) {
            SettingsView()
        }
    }
    
    // MARK: - Private view
    
    private var gradeView: some View {
        ScrollViewReader { scrollViewProxy in
            ScrollView(.vertical,showsIndicators: true) {
                Text(viewModel.displayedGrades)
                    .font(.system(size: Constants.gradeFontSize, weight: Constants.gradeFontWeight))
                    .foregroundColor(Constants.gradeColor)
                    .multilineTextAlignment(.trailing)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .id(Constants.gradeTextId)
            }
            .onChange(of: viewModel.displayedGrades) { _ in
                scrollViewProxy.scrollTo(Constants.gradeTextId, anchor: .bottom)
            }
        }
    }
    
    private var buttonsPad: some View {
        VStack(spacing: Constants.buttonPadding) {
            ForEach(viewModel.buttons, id: \.self) { row in
                HStack(spacing: Constants.buttonPadding) {
                    ForEach(row, id: \.self) { buttonType in
                        let isWide = row.count < Constants.buttonsRowsCount
                            && buttonType == lastGradeButton(from: row)
                        CalculatorButton(
                            buttonType: buttonType,
                            isWide: isWide) {
                                viewModel.didTap(button: buttonType)
                            }
                    }
                }
            }
        }
//        .animation(.interactiveSpring, value: viewModel.buttons)
    }
    
    // MARK: - Private methods
    
    private func lastGradeButton(from types: [ButtonType]) -> ButtonType? {
        types.filter { type in
            switch type {
            case .grade:
                return true
            default:
                return false
            }
        }.last
    }
}

/// Current info about calculating state
struct InformationPanelView: View {
    
    // MARK: - Properties
    
    let gradePointAverage: Double
    let gradesCount: String
    let currentMemory: String
    
    // MARK: - View
    
    var body: some View {
        HStack {
            Text(verbatim: String(format: Constants.gradeAverageFormat, gradePointAverage))
            Spacer()
            Text(verbatim: gradesCount)
            Spacer()
            Text(currentMemory)
        }
        .foregroundColor(Constants.infoPanelColor)
    }
}

// MARK: - Preview

#Preview {
    GradeCalculatorBuilder.makeCalculatorView()
}
