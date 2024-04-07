//
//  ContentView.swift
//  GradePointAverage
//
//  Created by Dmitriy Suprun on 20.03.24.
//

import SwiftUI

struct GradeCalculatorView: View {
    
    var viewModel: GradeCalculatorViewModel
    
    var body: some View {
        VStack {
            InformationPanelView(
                gpa: viewModel.gradePointAverage,
                gradesCount: viewModel.gradesCount,
                currentMemory: viewModel.currentMemory
            )
            Spacer()
            HStack {
                Spacer()
                Text(viewModel.displayedGrades)
                    .font(.system(size: 50))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.trailing)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                
            }
            buttonPad
        }
        .padding(Constants.padding)
        .background(Color.black)
    }
    
    private var buttonPad: some View {
        VStack(spacing: Constants.padding) {
            ForEach(viewModel.buttons, id: \.self) { row in
                HStack(spacing: Constants.padding) {
                    ForEach(row, id: \.self) { buttonType in
                        let test = row.count < 4 && buttonType == lastGradeButton(from: row)
                        CalculatorButton(
                            buttonType: buttonType,
                            isWide: test) {
                                viewModel.didTap(button: buttonType)
                            }
                    }
                }
            }
        }
    }
    
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

struct InformationPanelView: View {
    
    /// Grades Point Average
    let gpa: Double
    let gradesCount: String
    let currentMemory: String
    
    var body: some View {
        HStack {
            Text(verbatim: String(format: "%.2f", gpa))
            Spacer()
            Text(verbatim: gradesCount)
            Spacer()
            Text(currentMemory)
        }
        .foregroundColor(.white)
    }
}

#Preview {
    GradeCalculatorBuilder.makeCalculatorView()
}
