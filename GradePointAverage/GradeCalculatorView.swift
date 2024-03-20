//
//  ContentView.swift
//  GradePointAverage
//
//  Created by Dmitriy Suprun on 20.03.24.
//

import SwiftUI

enum CalcButton: String {
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

    @State var value = ""
    @State var currentMemory: String = CalcButton.memory1.rawValue
    @State var gradesMemory: [String:[Int]] = [CalcButton.memory1.rawValue:[]]
    var grades: [Int] {
        gradesMemory[currentMemory] ?? []
    }
    var gradePointAverage: Double {
        guard !grades.isEmpty else { return 0 }
        return (Double(grades.reduce(0, +)) / Double(grades.count) * 100).rounded() / 100
    }

    let buttons: [[CalcButton]] = [
       
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
                    Text(verbatim: String(format: "%.2f", gradePointAverage))
                    Spacer()
                    Text(verbatim: String(grades.count))
                    Spacer()
                    Text(currentMemory)
                }
                .padding()
                Spacer()

                // Text display
                HStack {
                    Spacer()
                    Text(value)
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
                                self.didTap(button: item)
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

    func didTap(button: CalcButton) {
        switch button {
        case .clear:
            value = ""
            gradesMemory[currentMemory]?.removeAll()
        case .back:
            guard !grades.isEmpty else { return }
            gradesMemory[currentMemory]?.removeLast()
            value = grades.map { String($0) }.joined(separator: " ")
        case .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .ten:
            guard let grade = Int(button.rawValue) else { return }
            gradesMemory[currentMemory]?.append(grade)
            let number = button.rawValue
            if value == "0" {
                value = number
            }
            else {
                value = grades.map { String($0) }.joined(separator: " ")
            }
        case .memory1, .memory2, .memory3:
            currentMemory = button.rawValue
            if grades.isEmpty {
                gradesMemory[currentMemory] = []
            }
            value = grades.map { String($0) }.joined(separator: " ")
        }
    }

    func buttonWidth(item: CalcButton) -> CGFloat {
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
    GradeCalculatorView()
}
