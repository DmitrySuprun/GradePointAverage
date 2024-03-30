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
        case .clear, .memory1, .memory2, .memory3:
            return .orange
        default:
            return Color(.systemGray4)
        }
    }
}

enum Operation {
    case add, subtract, multiply, divide, none
}

struct GradeCalculatorView: View {
    
    @StateObject var viewModel: GradeCalculatorViewModel

    let buttons: [[CalculatorButton]] = [
       
        [.seven, .eight, .nine, .memory1],
        [.four, .five, .six, .memory2],
        [.one, .two, .three, .memory3],
        [.ten, .back, .clear],
    ]

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)

            VStack {
                HStack {
                    Text(verbatim: String(format: "%.2f", viewModel.gradePointAverage))
                    Spacer()
                    Text(verbatim: viewModel.gradesCount)
                    Spacer()
                    Text(viewModel.currentMemory)
                }
                .padding()
                Spacer()

                // Text display
                HStack {
                    Spacer()
                    Text(viewModel.displayedGrades)
                        .multilineTextAlignment(.leading)
                        .bold()
                        .font(.system(size: 50))
                        .foregroundColor(.white)
                }
                .padding()

                // Our buttons
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { item in
                            Button(action: {
                                viewModel.didTap(button: item)
                            }, label: {
                                Text(item.rawValue)
                                    .font(.system(size: 32))
                                    .frame(
                                        width: self.buttonWidth(item: item),
                                        height: self.buttonHeight()
                                    )
                                    .background(item.buttonColor)
                                    .foregroundColor(.white)
                                    .cornerRadius(self.buttonWidth(item: item)/2)
                            })
                        }
                    }
                    .padding(.bottom, 3)
                }
            }
        }
    }

    func buttonWidth(item: CalculatorButton) -> CGFloat {
        if item == .ten {
            return ((UIScreen.main.bounds.width - (4*12)) / 4) * 2
        }
        return (UIScreen.main.bounds.width - (5*12)) / 4
    }

    func buttonHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - (5*12)) / 4
    }
}

#Preview {
    GradeCalculatorBuilder.makeCalculatorView()
}
