//
//  ContentView.swift
//  GradePointAverage
//
//  Created by Dmitriy Suprun on 20.03.24.
//

import SwiftUI

enum CalculatorButton: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case ten = "10"
    case clear = "AC"
    case back = "←"
    case memory1 = "M1"
    case memory2 = "M2"
    case memory3 = "M3"


    var buttonColor: Color {
        switch self {
        case .clear, .memory1, .memory2, .memory3, .back:
            return .orange
        default:
            return Color(.systemGray4)
        }
    }
}

struct GradeCalculatorView: View {
    
    @StateObject var viewModel: GradeCalculatorViewModel

    // Определяем столбцы для сетки
    private let columns: [GridItem] = {
        let columns = Array(repeating: GridItem(.flexible()), count: 3)
        return columns
    }()

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)

            VStack {
                InformationPanelView(
                    gpa: viewModel.gradePointAverage,
                    gradesCount: viewModel.gradesCount,
                    currentMemory: viewModel.currentMemory
                )
                .padding()

                Spacer()

                HStack {
                    Spacer()
                    Text(viewModel.displayedGrades)
                        .multilineTextAlignment(.trailing)
                        .bold()
                        .font(.system(size: 50))
                        .foregroundColor(.white)
                }
                .padding()

                Spacer()

                HStack(spacing: 20) {
                    VStack(spacing: 20) {
                        numblockButtons
                    }
                    VStack(spacing: 20) {
                        functionBlockButtons
                    }
                }
                .padding()
            }
        }
    }
    
    // MARK: - Private UI
    
    private var numblockButtons: some View {
        ForEach(0..<viewModel.buttons.count, id: \.self) { row in
            HStack(spacing: 30) {
                ForEach(viewModel.buttons[row], id: \.self) { item in
                    Button(action: {
                        viewModel.didTap(button: item)
                    }, label: {
                        let isLastButton = viewModel.buttons[row].last?.rawValue == item.rawValue
                        
                        let maxWidth: CGFloat = viewModel.buttons[row].count < 3 && isLastButton ? .infinity : 80
                      
                        Text(item.rawValue)
                            .font(.system(size: 32))
                            .frame(minWidth: 80, maxWidth: maxWidth, maxHeight: 80)
                            .background(item.buttonColor)
                            .foregroundColor(.white)
                            .cornerRadius(40)
                    })
                }
            }
        }
    }
    
    private var functionBlockButtons: some View {
        ForEach(viewModel.funcButtons, id: \.self) { item in
            Button(action: {
                viewModel.didTap(button: item)
            }, label: {
                Text(item.rawValue)
                    .font(.system(size: 32))
                    .frame(minWidth: 80, minHeight: 80)
                    .background(item.buttonColor)
                    .foregroundColor(.white)
                    .cornerRadius(40)
            })
        }
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
    }
}

#Preview {
    GradeCalculatorBuilder.makeCalculatorView()
}
